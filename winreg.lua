if jit.os ~= "Windows" then
    error("winreg module awaivable only for Win32 platform!")
else
    return require "win32.winreg"
end
