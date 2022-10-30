local ffi = require "ffi"
require "libcdef"
require "posix.posixdef"
local errno = require "posix.errnodef"
local C = ffi.C
local locale = C.newlocale(63, "", nil)

local function strerror(code)
    return ffi.string(C.strerror_l(code, locale))
end

local function scandir(path)
    path = path or "./"
    local dp = C.opendir(path)
    if dp == nil then
        error("[Errno "..errno[0].."] "..strerror(errno[0])..": "..path)
    end
    return function()
        while true do
            local ep = C.readdir(dp)
            if ep == nil then
                C.closedir(dp)
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
    sep = "/",
    altsep = nil,
    pathsep = ":",
    devnull = io.open("/dev/null"),
    abort = function()
        C.kill(C.getpid(), C.SIGABRT)
    end,
    write = io.write,
    read = io.read,
    getenv = function(key, default)
        local ptr = C.getenv(key)
        if ptr == nil then
            return default
        end
        return string(ptr)
    end,
    scandir = scandir,
    strerror = strerror,
    getpid = C.getpid,
    getppid = C.getppid
}