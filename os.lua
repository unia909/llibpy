if jit.os ~= "Windows" then
    return require "posix.os"
else
    error("no implementation for Windows")
end