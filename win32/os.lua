local ffi = require "ffi"
require "libcdef"
require "win32.winntdef"
local con = require "_con"
local ntstr = require "win32.string"
local C = ffi.C

local function scandir(path)
    if path then
        if path[#path-1] == '\\' or path[#path-1] == '/' then
            path = path:substr(0, path.size()-1)
        end
        path = path.."\\*"
    else
        path = ".\\*"
    end

    local hFind = ffi.new("void*")
    local fdata = ffi.new("WIN32_FIND_DATAW")
    
    hFind = C.FindFirstFileW(ntstr.convtowide(path), fdata)
    if hFind == C.INVALID_HANDLE_VALUE then
        error("can't open directory")
    end

    local findNextFile = function()
        if C.FindNextFileW(hFind, fdata) == 0 then
            C.FindClose(hFind)
            local err = ffi.errno()
            if err ~= C.ERROR_NO_MORE_FILES then
                error("some other error with opening directory: "..err)
            end
            return true
        end
    end

    -- if first file is current directory (.)
    if C.memcmp(fdata.cFileName, ffi.new("char[4]", 46, 0, 0, 0), 4) == 0 then
        C.FindNextFileW(hFind, fdata) -- skip this file
        return function()
            if findNextFile() then return nil end -- and first call also skips prevision directory (..)
            return ntstr.convtostr(fdata.cFileName)
        end
    end

    local isFirst = true
    return function()
        if isFirst then
            isFirst = false
        else
            if findNextFile() then return nil end
        end
        return ntstr.convtostr(fdata.cFileName)
    end
end

return {
    name = "nt",
    sep = "\\",
    altsep = "/",
    pathsep = ";",
    devnull = io.open("nil"),
    abort = function()
        C.ExitProcess(3)
    end,
    read = con.read,
    write = con.write,
    getenv = function(key, default)
        local buf = ffi.new("wchar_t[32767]") -- 32767 is the maximum environment variable size as stated on MSDN
        local ret = C.GetEnvironmentVariableW(ntstr.convtowide(key), buf, 32767) -- on success ret is a length of the variable
        if ret == 0 then -- if there a error
            local err = ffi.errno()
            if err == C.ERROR_ENVVAR_NOT_FOUND then
                return default
            end
            error("strange error in getenv: "..err)
        end
        return ntstr.convtostr(buf, ret)
    end,
    scandir = scandir,
    strerror = function(code)
        local buf = ffi.new("wchar_t*[1]")
        -- 0x0100 is a flag telling Windows to allocate memory for the buffer
        -- 0x1000 is a flag for getting error message from system
        -- 0x0100 | 0x1000 is 0x1100
        local ret = C.FormatMessageW(0x1100, nil, code, 0, buf, 0, nil)
        local out = ntstr.convtostr(buf[0], ret + 1)
        C.LocalFree(buf[0])
        return out
    end,
    getpid = C.GetCurrentProcessId,
    getppid = function()
        local hSnapShot = C.CreateToolhelp32Snapshot(C.TH32CS_SNAPPROCESS, 0)
        if hSnapShot == nil then
            error("error: "..ffi.errno())
        end
        local procentry = ffi.new("PROCESSENTRY32")
        procentry.dwSize = ffi.sizeof(procentry)
        local bContinue = C.Process32First(hSnapShot, procentry)
        local pid = 0
        -- While there are processes, keep looping.
        local crtpid = C.GetCurrentProcessId()
        while bContinue do
            if crtpid == procentry.th32ProcessID then
                pid = procentry.th32ParentProcessID
                break
            end

            procentry.dwSize = ffi.sizeof("PROCESSENTRY32")
            bContinue = C.Process32Next(hSnapShot, procentry)
        end
        C.CloseHandle(hSnapShot)
        return pid
    end
}
