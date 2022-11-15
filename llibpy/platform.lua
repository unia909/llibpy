local platform
if jit.os ~= "Windows" then
    platform = require "posix.platform"
else
    platform = require "win32.platform"
end

function platform.system()
    local s = jit.os
    if s == "OSX" then
        return "Darwin"
    elseif s == "Other" then
        return ""
    end
    return s
end

function platform.python_implementation()
    return "Lython"
end

return platform
