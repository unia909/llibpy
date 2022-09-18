local ffi = require "ffi"
require "posix.posixdef"

local function scandir(path)
    path = path or "./"
    local dp = ffi.new("DIR*")
    local ep = ffi.new("struct dirent*")
    dp = ffi.C.opendir(path)
    if dp == nil then
        error("[Errno "..errno[0].."] "..ffi.string(ffi.C.strerror(errno[0]))..": "..path)
    end
    return function()
        while true do
            ep = ffi.C.readdir(dp)
            if ep == nil then
                ffi.C.closedir(dp)
                return nil
            end
            local s = ffi.string(ep.d_name)
            if s ~= "." and s ~= ".." then
                return s
            end
        end
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
    scandir = scandir,
    getpid = ffi.C.getpid,
    getppid = ffi.C.getppid
}