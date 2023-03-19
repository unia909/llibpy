local ffi = require "ffi"

local registered_functions = {}

local function atexit()
    for i, value in ipairs(registered_functions) do
        value[1](unpack(value[2]))
    end
end

-- analog to __gc in luajit
ffi.gc(ffi.cast("void*", 0), atexit)

return {
    register = function(func, ...)
        table.insert(registered_functions, {func, {...}})
    end,
    unregister = function(func)
        for i, value in ipairs(registered_functions) do
            if value == func then
                table.remove(registered_functions, i)
                break
            end
        end
    end
}
