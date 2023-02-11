local random = require "random"
local _os = os
local os
if jit.os ~= "Windows" then
    os = require "posix.os"
else
    os = require "win32.os"
end

function os.listdir(path)
    local out = {}
    for dir in os.scandir(path) do
        table.insert(out, dir)
    end
    return out
end

os.curdir = "."
os.pardir = ".."
os.extsep = "."
os.urandom = random.randbytes
os.remove = _os.remove
os.rename = _os.rename
os.system = _os.execute
os._exit = _os.exit

return os
