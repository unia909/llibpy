if jit.os ~= "Windows" then
    error("winsound module awaivable only for Win32 platform!")
else
    return require "win32.winsound"
end