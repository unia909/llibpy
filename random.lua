require "libpy"
local ffi = require "ffi"
local rand = require "random_osdep"

math.randomseed(os.time())

return {
    seed = math.randomseed,
    randbytes = function(n)
        local b = bytes(n)
        rand(b.source, n)
        return b
    end,
    randint = math.random
}