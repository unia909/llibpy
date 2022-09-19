local ffi = require "ffi"
require "libcdef"
require "win32.winntdef"
require "win32.errnodef"

local hOut = ffi.C.GetStdHandle(-11)

function _win_convtowide(str, len)
    len = len or #str + 1
    local wide = ffi.new("wchar_t[?]", len)
    ffi.C.MultiByteToWideChar(ffi.C.CP_UTF8, 0, str, len, wide, len)
    return wide
end

function _win_convtostr(wide, len)
    len = len or ffi.C.wcslen(wide) + 1
    local size = ffi.C.WideCharToMultiByte(ffi.C.CP_UTF8, 0, wide, len, nil, 0, nil, nil)
    local str = ffi.new("char[?]", size)
    ffi.C.WideCharToMultiByte(ffi.C.CP_UTF8, 0, wide, len, str, size, nil, nil)
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
    
    hFind = ffi.C.FindFirstFileW(_win_convtowide(path), fdata)
    if hFind == ffi.C.INVALID_HANDLE_VALUE then
        error("can't open directory")
    end

    local findNextFile = function()
        if ffi.C.FindNextFileW(hFind, fdata) == 0 then
            if ffi.C.GetLastError() ~= ffi.C.ERROR_NO_MORE_FILES then
                ffi.C.FindClose(hFind)
                error("some other error with opening directory: "..ffi.C.GetLastError())
            end
            ffi.C.FindClose(hFind)
            return true
        end
    end

    -- if first file is current directory (.)
    if ffi.C.memcmp(fdata.cFileName, ffi.new("char[4]", 46, 0, 0, 0), 4) == 0 then
        ffi.C.FindNextFileW(hFind, fdata) -- skip this file
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
    abort = function()
        ffi.C.ExitProcess(3)
    end,
    write = function(str)
        local len = #str
        ffi.C.WriteConsoleW(hOut, _win_convtowide(str, len), len, nil, nil)
    end,
    getenv = function(key, default)
        local buf = ffi.new("wchar_t[32767]") -- 32767 is the maximum environment variable size as stated on MSDN
        local ret = ffi.C.GetEnvironmentVariableW(_win_convtowide(key), buf, 32767) -- on success ret is a length of the variable
        if ret == 0 then -- if there a error
            local err = ffi.C.GetLastError()
            if err == ffi.C.ERROR_ENVVAR_NOT_FOUND then
                return default
            end
            error("strange error in libpy: "..err)
        end
        return _win_convtostr(buf, ret + 1) -- include null character
    end,
    scandir = scandir,
    strerror = function(code)
        local buf = ffi.new("wchar_t*[1]")
        -- 0x00000100 is a flag telling Windows to allocate memory for the buffer
        -- 0x00001000 is a flag for getting error message from system
        -- 0x00000100 | 0x00001000 is 4352 in decimal
        local ret = ffi.C.FormatMessageW(4352, nil, code, 0, buf, 0, nil)
        local out = _win_convtostr(buf[0], ret + 1)
        ffi.C.LocalFree(buf[0])
        return out
    end,
    getpid = ffi.C.GetCurrentProcessId,
    getppid = function()
        local hSnapShot = ffi.C.CreateToolhelp32Snapshot(ffi.C.TH32CS_SNAPPROCESS, 0)
        if hSnapShot == nil then
            error("error: "..ffi.C.GetLastError())
        end
        local procentry = ffi.new("PROCESSENTRY32")
        procentry.dwSize = ffi.sizeof(procentry)
        local bContinue = ffi.C.Process32First(hSnapShot, procentry)
        local pid = 0
        -- While there are processes, keep looping.
        local crtpid = ffi.C.GetCurrentProcessId()
        while bContinue do
            if crtpid == procentry.th32ProcessID then
                pid = procentry.th32ParentProcessID
                break
            end

            procentry.dwSize = ffi.sizeof("PROCESSENTRY32")
            bContinue = ffi.C.Process32Next(hSnapShot, procentry)
        end
        ffi.C.CloseHandle(hSnapShot)
        return pid
    end
}