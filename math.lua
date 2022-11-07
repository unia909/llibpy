local ffi = require "ffi"
require "libcdef"
ffi.cdef [[
    double fabs(double);
    double exp2(double);
    double acosh(double);
    double asinh(double);
    double atanh(double);
    double log1p(double);
    double log2(double);
    double erf(double);
    double erfc(double);
    double cbrt(double);
    double nexttoward(double, double);
    double remainder(double, double);
]]
local C = ffi.C
local bit = require "bit"
local lshift = bit.lshift
local rshift = bit.rshift

local inf = math.huge
local nan = inf/inf
local pi = math.pi
local sin = math.sin
local exp = math.exp
local sqrt = math.sqrt
local floor = math.floor
local ceil = math.ceil
local log = math.log
local abs = math.abs
local max = math.max
local fabs = C.fabs
local frexp = math.frexp
local ldexp = math.ldexp
local nexttoward = C.nexttoward
local exp1 = exp(1)

-- from https://stackoverflow.com/a/35499347
-- converted to luajit code
local function factorial(a)
    if a == 0 then
        return 1
    end
    return a * factorial(a - 1)
end

-- from https://www.codeproject.com/Tips/156748/Fast-Greatest-Common-Divisor-GCD-Algorithm-3
-- converted to luajit code
local function gcd(a, b)
    local q
    while b ~= 0 do
        q = b
        b = a % b
        a = q
    end
    return a
end

-- from https://github.com/stepelu/lua-sci/blob/master/math.lua
local gamma_dk = ffi.new("double[11]",
    2.48574089138753565546e-5,
    1.05142378581721974210,
    -3.45687097222016235469,
    4.51227709466894823700,
    -2.98285225323576655721,
    1.05639711577126713077,
    -1.95428773191645869583e-1,
    1.70970543404441224307e-2,
    -5.71926117404305781283e-4,
    4.63399473359905636708e-6,
    -2.71994908488607703910e-9
)
local gamma_r10 = 10.900511
local gamma_c = 2*sqrt(exp1/pi)

local function gamma(z)
    -- Reflection formula to handle negative z plane.
    -- Better to branch at z < 0 as some use cases focus on z >= 0 only.
    if z < 0 then
        return pi/(sin(pi*z)*gamma(1 - z))
    end
    local sum = gamma_dk[0]
              + gamma_dk[1]/z
              + gamma_dk[2]/(z + 1)
              + gamma_dk[3]/(z + 2)
              + gamma_dk[4]/(z + 3)
              + gamma_dk[5]/(z + 4)
              + gamma_dk[6]/(z + 5)
              + gamma_dk[7]/(z + 6)
              + gamma_dk[8]/(z + 7)
              + gamma_dk[9]/(z + 8)
              + gamma_dk[10]/(z + 9)
    return floor((gamma_c*((z  + gamma_r10 - 0.5)/exp1)^(z - 0.5)*sum)+0.5)
end

local function lgamma(z)
    if z < 0 then
        return log(pi) - log(abs(sin(pi*z))) - lgamma(1 - z)
    end
    local sum = gamma_dk[0]
              + gamma_dk[1]/z
              + gamma_dk[2]/(z + 1)
              + gamma_dk[3]/(z + 2)
              + gamma_dk[4]/(z + 3)
              + gamma_dk[5]/(z + 4)
              + gamma_dk[6]/(z + 5)
              + gamma_dk[7]/(z + 6)
              + gamma_dk[8]/(z + 7)
              + gamma_dk[9]/(z + 8)
              + gamma_dk[10]/(z + 9)
    -- For z >= 0 gamma function is positive, no abs() required.
    return log(gamma_c) + (z - 0.5)*log(z  + gamma_r10 - 0.5)
        - (z - 0.5) + log(sum)
end

return {
    ceil = ceil,
    comb = function(n, k)
        return factorial(n) / (factorial(k) * factorial(n - k))
    end,
    copysign = function(x, y)
        if (y > 0 and x < 0) or (y < 0 and x > 0) then
            return -x
        end
        return x
    end,
    fabs = fabs,
    factorial = factorial,
    floor = floor,
    fmod = math.fmod,
    frexp = frexp,
    -- from http://lua-users.org/wiki/FloatSum
    fsum = function(iterable)
        local p = {1}        -- p[1] == #p
        for x in iter(iterable) do
            local i = 2
            for j = 2, p[1] do
                local y = p[j]
                if abs(x) < abs(y) then x, y = y, x end
                local hi = x + y
                local lo = y - (hi - x)
                x = hi
                if lo ~= 0 then p[i] = lo; i = i + 1 end
            end
            if x - x ~= 0 then i = 2 end    -- Inf or NaN
            p[1] = i
            p[i] = x
        end
        local x = 0
        for i = p[1], 2, -1 do          -- sum in reverse
            local y = p[i]
            local hi = x + y
            local lo = y - (hi - x)
            x = hi
            if lo ~= 0 and i ~= 2 then  -- check half way case
                if (lo < 0) == (p[i-1] < 0) then
                    lo = lo * 2         -- |lo| = 1/2 ULP
                    hi = x + lo         -- -> x off 1 ULP
                    if lo == hi - x then x = hi end
                end
                return x
            end
        end
        return x
    end,
    gcd = gcd,
    isclose = function(a, b, rel_tol, abs_tol)
        return abs(a-b) <= max((rel_tol or 1e-09) * max(abs(a), abs(b)), (abs_tol or 0))
    end,
    isfinite = function(x)
        return x == inf or x == nan or x == 0
    end,
    isinf = function(x)
        return x == inf or x == -inf
    end,
    isnan = function(x)
        return x == nan
    end,
    -- from https://github.com/AlanCxxx/isqrt
    -- converted to luajit code
    isqrt = function(n)
        local res = 0
        local one = 0x40000000

        while one > n do
            one = rshift(one, 2)
        end
        while one ~= 0 do
            if n >= res + one then
                n = n - res - one
                res = res + lshift(one, 1)
            end
            res = rshift(res, 1)
            one = rshift(one, 2)
        end
        return res
    end,
    -- from https://qnaplus.com/c-program-compute-lcm-multiple-integers/
    -- converted to luajit code
    lcm = function(...)
        local nargs = select("#", ...)
        local res = select(1, ...)
        for i in range(2, nargs + 1) do
            local a = select(i, ...)
            res = (res / gcd(res, a)) * a
        end
        return res
    end,
    ldexp = ldexp,
    modf = math.modf,
    nextafter = function(x, y)
        if x > y then
            return x - .0000000000001
        else
            return x + .0000000000001
        end
    end,
    perm = function(n, k)
        if k == nil then
            k = n
        elseif n < k then
            return 0
        end
        return factorial(n) / factorial(n - k)
    end,
    prod = function(iterable, start)
        local start = start or 1
        for i, n in pairs(iterable) do
            start = start * n
        end
        return start
    end,
    remainder = C.remainder,
    trunc = function(x)
        if type(x) ~= "number" then
            if type(x.__trunc__) == "function" then
                return x:__trunc__()
            else
                error("ValueError: x doesn't define __trunc__ method")
            end
        elseif x < 0 then
            return ceil(x)
        end
        return floor(x)
    end,
    -- from https://stackoverflow.com/a/54462832
    -- converted to luajit
    ulp = function(x)
        if x > 0 then
            return nexttoward(x, inf) - x
        else
            return x - nexttoward(x, -inf)
        end
    end,

    cbrt = C.cbrt,
    exp = exp,
    exp2 = C.exp2,
    expm1 = function(x)
        return exp(x) - 1
    end,
    log = log,
    log1p = C.log1p,
    log2 = C.log2,
    log10 = math.log10,
    pow = pow,
    sqrt = sqrt,

    acos = math.acos,
    asin = math.asin,
    atan = math.atan,
    atan2 = math.atan2,
    cos = math.cos,
    dist = function(p, q)
        local sum = 0
        for i, px in ipairs(p) do
            local qx = q[i]
            sum = sum + (px - qx) * (px - qx)
        end
        return sqrt(sum)
    end,
    hypot = function(...)
        local nargs = select("#", ...)
        local sum = 0
        for i = 1, nargs do
            local v = select(i, ...)
            sum = sum + v * v
        end
        return sqrt(sum)
    end,
    sin = sin,
    tan = math.tan,
    degrees = math.deg,
    radians = math.rad,

    acosh = C.acosh,
    asinh = C.asinh,
    atanh = C.atanh,
    cosh = math.cosh,
    sinh = math.sinh,
    tanh = math.tanh,

    erf = C.erf,
    erfc = C.erfc,
    gamma = gamma,
    lgamma = lgamma,

    pi = pi,
    e = 2.718281828459045, -- full value 2.718281828459045235360287471352662497757247093699959574966967627724076630353
    tau = 6.283185307179586,
    inf = inf,
    nan = nan
}
