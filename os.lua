if jit.os ~= "Windows" then
    return require "posix.os"
else
    return require "win32.os"
end