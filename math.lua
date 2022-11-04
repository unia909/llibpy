local ffi = require "ffi"
ffi.cdef [[
    double fabs(double val);
]]
local C = ffi.C

local nan = math.huge/math.huge

local function factorial(a)
    if a == 0 then
        return 1
    end
    return a * factorial(a - 1)
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
    --gcd =
    --isclose =
    isfinite = function(x)
        return x == math.huge or x == nan or x == 0
    end,
    isinf = function(x)
        return x == math.huge or x == -math.huge
    end,
    isnan = function(x)
        return x == nan
    end,
    --isqrt =
    --lcm =
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
    inf = math.huge,
    nan = nan
}
