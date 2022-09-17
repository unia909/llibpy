local ffi = require "ffi"
require "libcdef"
require "win32.winntdef"

local function scandir(path)
    if path then
        if path[#path-1] == '\\' or path[#path-1] == '/' then
            path = path:substr(0, path.size()-1)
        end
        path = path.."\\*"
    else
        path = ".\\*"
    end

    local pathlen = #path + 1
    local pathw = ffi.new("wchar_t[?]", pathlen)
    ffi.C.MultiByteToWideChar(ffi.C.CP_UTF8, 0, path, pathlen, pathw, pathlen)

    local isFirst = false
    local hFind = ffi.new("void*")
    local fdata = ffi.new("WIN32_FIND_DATAW")
    
    hFind = ffi.C.FindFirstFileW(pathw, fdata)
    if hFind == INVALID_HANDLE_VALUE then
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

    return function()
        if isFirst then
            isFirst = false
        else
            if findNextFile() then return nil end
        end
        while true do
            local namelen = ffi.C.wcslen(fdata.cFileName) + 1
            local name = ffi.new("char[?]", namelen)
            ffi.C.WideCharToMultiByte(ffi.C.CP_UTF8, 0, fdata.cFileName, namelen, name, namelen, nil, nil)
            local s = ffi.string(name)
            if s ~= "." and s ~= ".." then
                return s
            end
            if findNextFile() then return nil end
        end
    end
end

return {
    name = "nt",
    listdir = function(path)
        local out = {}
        for dir in scandir(path) do
            table.insert(out, dir)
        end
        return out
    end,
    scandir = scandir
}