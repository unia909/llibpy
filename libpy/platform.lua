local platform
if jit.os ~= "Windows" then
    platform = require "posix.platform"
else
    platform = require "win32.platform"
end

platform.processor = platform.machine

function platform.system()
    local s = jit.os
    if s == "OSX" then
        return "Darwin"
    elseif s == "Other" then
        return ""
    end
    return s
end

function platform.python_build()
    return "default", "Mar 19 2023 21:28:39"
end

function platform.python_compiler()
    return jit.version
end

function platform.python_branch()
    return ""
end

function platform.python_implementation()
    return "Lython"
end

function platform.python_revision()
    return ""
end

function platform.python_version_tuple()
    return "3", "11", "2"
end

function platform.platform()
    return platform.system().."-"..platform.version()
end

return platform
