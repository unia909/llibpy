if jit.os ~= "Windows" then
    require "posix.libcdef"
else
    error("no implementation for Windows")
end