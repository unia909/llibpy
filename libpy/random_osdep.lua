if jit.os == "Windows" then
    return require "win32.random_osdep"
elseif jit.os == "Linux" then
    return require "linux.random_osdep"
elseif jit.os == "BSD" or jit.os == "OSX" then
    return require "bsd.random_osdep"
else
    return require "posix.random_osdep"
end