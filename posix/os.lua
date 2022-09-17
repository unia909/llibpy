local ffi = require "ffi"
require "libcdef"

local function scandir(path)
    local dp = ffi.new("DIR*")
    local ep = ffi.new("struct dirent*")
    dp = ffi.C.opendir(path)
    if dp ~= nil then
        return function()
            ep = ffi.C.readdir(dp)
            if ep == nil then
                ffi.C.closedir(dp)
                return nil
            end
            return ffi.string(ep.d_name)
        end
    else
        error("[Errno "..errno[0].."] "..ffi.string(ffi.C.strerror(errno[0]))..": "..path)
    end
end

return {
    name = "posix",
    listdir = function(path)
        local out = {}
        for dir in scandir(path) do
            table.insert(out, dir)
        end
        return out
    end,
    scandir = scandir
}