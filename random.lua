require "libpy"
local ffi = require "ffi"
local rand = require "random_osdep"

math.randomseed(os.time())

return {
    seed = math.randomseed,
    randbytes = function(n)
        local b = ffi.new("unsigned char[?]", n)
        rand(b, n)
        return b
    end,
    randint = math.random
}