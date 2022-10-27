local ffi = require "ffi"
require "libcdef"
require "win32.winntdef"
require "win32.errnodef"
local C = ffi.C

local hOut = C.GetStdHandle(-11)

function _win_convtowide(str, len)
    len = len or #str + 1 -- we need to add 1 to get valid C string with null-terminator
    local wide = ffi.new("wchar_t[?]", len)
    C.MultiByteToWideChar(C.CP_UTF8, 0, str, len, wide, len)
    return wide
end

function _win_convtostr(wide, len)
    len = len or C.wcslen(wide) -- no need to add 1 for null-terminator in _win_convtostr due to copying in ffi.string
    local size = C.WideCharToMultiByte(C.CP_UTF8, 0, wide, len, nil, 0, nil, nil)
    local str = ffi.new("char[?]", size)
    C.WideCharToMultiByte(C.CP_UTF8, 0, wide, len, str, size, nil, nil)
    return ffi.string(str, size)
end

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
    
    hFind = C.FindFirstFileW(_win_convtowide(path), fdata)
    if hFind == C.INVALID_HANDLE_VALUE then
        error("can't open directory")
    end

    local findNextFile = function()
        if C.FindNextFileW(hFind, fdata) == 0 then
            C.FindClose(hFind)
            if C.GetLastError() ~= C.ERROR_NO_MORE_FILES then
                error("some other error with opening directory: "..C.GetLastError())
            end
            return true
        end
    end

    -- if first file is current directory (.)
    if C.memcmp(fdata.cFileName, ffi.new("char[4]", 46, 0, 0, 0), 4) == 0 then
        C.FindNextFileW(hFind, fdata) -- skip this file
        return function()
            if findNextFile() then return nil end -- and first call also skips prevision directory (..)
            return _win_convtostr(fdata.cFileName)
        end
    end

    local isFirst = true
    return function()
        if isFirst then
            isFirst = false
        else
            if findNextFile() then return nil end
        end
        return _win_convtostr(fdata.cFileName)
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
    write = function(str)
        local len = #str
        C.WriteConsoleW(hOut, _win_convtowide(str, len), len, nil, nil)
    end,
    getenv = function(key, default)
        local buf = ffi.new("wchar_t[32767]") -- 32767 is the maximum environment variable size as stated on MSDN
        local ret = C.GetEnvironmentVariableW(_win_convtowide(key), buf, 32767) -- on success ret is a length of the variable
        if ret == 0 then -- if there a error
            local err = C.GetLastError()
            if err == C.ERROR_ENVVAR_NOT_FOUND then
                return default
            end
            error("strange error in getenv: "..err)
        end
        return _win_convtostr(buf, ret)
    end,
    scandir = scandir,
    strerror = function(code)
        local buf = ffi.new("wchar_t*[1]")
        -- 0x0100 is a flag telling Windows to allocate memory for the buffer
        -- 0x1000 is a flag for getting error message from system
        -- 0x0100 | 0x1000 is 0x1100
        local ret = C.FormatMessageW(0x1100, nil, code, 0, buf, 0, nil)
        local out = _win_convtostr(buf[0], ret + 1)
        C.LocalFree(buf[0])
        return out
    end,
    getpid = C.GetCurrentProcessId,
    getppid = function()
        local hSnapShot = C.CreateToolhelp32Snapshot(C.TH32CS_SNAPPROCESS, 0)
        if hSnapShot == nil then
            error("error: "..C.GetLastError())
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