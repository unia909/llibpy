local ffi = require "ffi"
ffi.cdef [[
    double fabs(double val);
]]
local C = ffi.C
local bit = require "bit"
local lshift = bit.lshift
local rshift = bit.rshift

local inf = math.huge
local nan = inf/inf

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

return {
    ceil = math.ceil,
    comb = function(n, k)
        return factorial(n) / (factorial(k) * factorial(n - k))
    end,
    copysign = function(x, y)
        if (y > 0 and x < 0) or (y < 0 and x > 0) then
            return -x
        end
        return x
    end,
    fabs = C.fabs,
    factorial = factorial,
    floor = math.floor,
    fmod = math.fmod,
    --frepx =
    --fsum =
    gcd = gcd,
    --isclose =
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
    --ldexp =
    modf = math.modf,
    --nextafter =
    --perm =
    --prod =
    --remainder =
    --trunc =
    --ulp =

    --cbrt
    exp = math.exp,
    exp2 = function(x)
        return math.pow(2, x)
    end,
    expm1 = function(x)
        return math.exp(x) - 1
    end,
    log = math.log,
    --log1p =
    --log2 =
    --log10 =
    pow = math.pow,
    sqrt = math.sqrt,

    acos = math.acos,
    asin = math.asin,
    atan = math.atan,
    atan2 = math.atan2,
    cos = math.cos,
    dist = function(p, q)
        local sum = 0
        for i, px in ipairs(p) do
            local qx = q[i]
            sum = sum + ((px - qx) * ((px - qx)))
        end
        return math.sqrt(sum)
    end,
    hypot = function(coordinates)
        local sum = 0
        for i in pairs(coordinates) do
            sum = sum + i * i
        end
        return math.sqrt(sum)
    end,
    sin = math.sin,
    tan = math.tan,
    degrees = math.deg,
    radians = math.rad,

    --acosh =
    --asinh =
    --atanh =
    cosh = math.cosh,
    sinh = math.sinh,
    tanh = math.tanh,

    --erf =
    --erfc =
    --gamma =
    --lgamma

    pi = math.pi,
    e = 2.718281828459045, -- full value 2.718281828459045235360287471352662497757247093699959574966967627724076630353
    tau = 6.283185307179586,
    inf = inf,
    nan = nan
}
