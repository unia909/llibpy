local ffi = require "ffi"
ffi.cdef"int atexit(void(*)());"

local registered_functions = {}

local function atexit()
    for key, value in pairs(registered_functions) do
        key(unpack(value))
    end
end

ffi.C.atexit(atexit)

return {
    register = function(func, ...)
        registered_functions[func] = {...}
    end,
    unregister = function(func)
        registered_functions[func] = nil
    end
}
