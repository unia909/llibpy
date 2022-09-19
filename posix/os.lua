local ffi = require "ffi"
require "libcdef"
require "posix.posixdef"
local errno = require "posix.errnodef"
local locale = ffi.C.newlocale(63, "", nil)

local function strerror(code)
    return ffi.string(ffi.C.strerror_l(code, locale))
end

local function scandir(path)
    path = path or "./"
    local dp = ffi.C.opendir(path)
    if dp == nil then
        error("[Errno "..errno[0].."] "..strerror(errno[0])..": "..path)
    end
    return function()
        while true do
            local ep = ffi.C.readdir(dp)
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
    abort = function()
        ffi.C.kill(ffi.C.getpid(), ffi.C.SIGABRT)
    end,
    write = require("io").write,
    getenv = function(key, default)
        local ptr = ffi.C.getenv(key)
        if ptr == nil then
            return default
        end
        return ffi.string(ptr)
    end,
    scandir = scandir,
    strerror = strerror,
    getpid = ffi.C.getpid,
    getppid = ffi.C.getppid
}