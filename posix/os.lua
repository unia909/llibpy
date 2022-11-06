local ffi = require "ffi"
ffi.cdef[[
    enum
    {
        SIGINT = 2,
        SIGQUIT,
        SIGILL,
        SIGTRAP,
        SIGABRT,
        SIGFPE = 8,
        SIGKILL,
        SIGSEGV = 11,
        SIGPIPE = 13,
        SIGALRM,
        SIGTERM
    };
    struct dirent
    {
        size_t d_ino;
        size_t d_off;
        unsigned short int d_reclen;
        unsigned char d_type;
        char d_name[256];
    };
    void *opendir(const char *dirname);
    struct dirent *readdir(void *dirstream);
    int closedir(void *dirstream);

    int getpid();
    int getppid();
    int kill(int pid, int sig);

    char *getenv(const char *envname);
    int setenv(const char *name, const char *value, int overwrite);
    int unsetenv(const char *name);

    void *newlocale(int category_mask, const char *locale, void *base);

    void *popen(const char *command, const char *type);
    size_t fread(void *ptrvoid, size_t size, size_t count, void *filestream);
    int pclose(void *stream);
]]
local C = ffi.C
local locale = C.newlocale(63, "", nil)
local strerror_l = C.strerror_l
local opendir = C.opendir
local readdir = C.readdir
local closedir = C.closedir
local kill = C.kill
local getpid = C.getpid
local getppid = C.getppid
local SIGABRT = C.SIGABRT
local getenv = C.getenv
local setenv = C.setenv
local unsetenv = C.unsetenv
local popen = C.popen
local fread = C.fread
local pclose = C.pclose

local ffit = require "ffitypes"
local chara = require "chara"

local function strerror(code)
    return ffi.string(strerror_l(code, locale))
end

local function scandir(path)
    path = path or "./"
    local dp = opendir(path)
    if dp == nil then
        error("[Errno "..ffi.errno().."] "..strerror(ffi.errno())..": "..path)
    end
    return function()
        while true do
            local ep = readdir(dp)
            if ep == nil then
                closedir(dp)
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
        kill(getpid(), SIGABRT)
    end,
    write = io.write,
    read = io.read,
    getenv = function(key, default)
        local ptr = getenv(key)
        if ptr == nil then
            return default
        end
        return ffi.string(ptr)
    end,
    putenv = function(key, value)
        setenv(key, value, 1)
    end,
    unsetenv = unsetenv,
    scandir = scandir,
    strerror = strerror,
    getpid = getpid,
    getppid = getppid,
    uname = function()
        local read = function(cmd)
            local f = popen(cmd, "r")
            local s = ""
            local buf = chara(128)
            local readed = 128
            while readed == 128 do
                readed = fread(buf, 1, 128, f)
                s = s..ffi.string(buf, readed)
            end
            pclose(f)
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
