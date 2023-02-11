if jit.os ~= "Windows" then
    error("msvcrt module awaivable only for Win32 platform!")
else
    return require "win32.msvcrt"
end