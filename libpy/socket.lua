require "libpy.__init__"
local socket
if jit.os == "Windows" then
    socket = require "win32.socket"
else
    socket = require "posix.socket"
end

socket.error = OSError
socket.herror = class("herror", {OSError})
socket.gaierror = class("gaierror", {OSError})
socket.timeout = TimeoutError

return socket
