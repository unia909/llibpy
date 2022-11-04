local ffi = require "ffi"
require "libcdef"
require "posix.posixdef"
local C = ffi.C
local locale = C.newlocale(63, "", nil)

local ffit = require "ffitypes"
local chara = require "chara"

ffi.cdef[[
    void *popen(const char *command, const char *type);
    size_t fread(void *ptrvoid, size_t size, size_t count, void *filestream);
    int pclose(void *stream);
]]

local function strerror(code)
    return ffi.string(C.strerror_l(code, locale))
end

local function scandir(path)
    path = path or "./"
    local dp = C.opendir(path)
    if dp == nil then
        error("[Errno "..ffi.errno().."] "..strerror(ffi.errno())..": "..path)
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
        return ffi.string(ptr)
    end,
    putenv = function(key, value)
        C.setenv(key, value, 1)
    end,
    unsetenv = C.unsetenv,
    scandir = scandir,
    strerror = strerror,
    getpid = C.getpid,
    getppid = C.getppid,
    uname = function()
        local read = function(cmd)
            local f = C.popen(cmd, "r")
            local s = ""
            local buf = chara(128)
            local readed = 128
            while readed == 128 do
                readed = C.fread(buf, 1, 128, f)
                s = s..ffi.string(buf, readed)
            end
            C.pclose(f)
            return s:sub(1, -2)
        end
        return {
            sysname = read("uname -s"),
            nodename = read("uname -n"),
            release = read("uname -r"),
            version = read("uname -v"),
            machine = read("uname -m")
        }
    end
}
