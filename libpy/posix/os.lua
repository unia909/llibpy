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
]]
local C = ffi.C
local locale = C.newlocale(63, "", nil)

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
    cpu_count = function()
        return tonumber(os.execute("cat /proc/cpuinfo | grep processor | wc -l"))
    end,
    sep = "/",
    altsep = nil,
    pathsep = ":",
    devnull = io.open("/dev/null"),
    abort = function()
        C.kill(C.getpid(), SIGABRT)
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
            local f = io.popen(cmd)
            local s = f:read("*a")
            f:close()
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
