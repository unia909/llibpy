if jit.os == "Windows" then
    return require "win32._con"
else
    return require "posix._con"
end