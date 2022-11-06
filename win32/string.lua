local ffi = require "ffi"
require "libcdef"
require "win32.winntdef"
ffi.cdef [[
    int MultiByteToWideChar(unsigned int CodePage, unsigned long dwFlags, const char *lpMultiByteStr, int cbMultiByte,
                            wchar_t *lpWideCharStr, int cchWideChar);
    int WideCharToMultiByte(unsigned int CodePage, unsigned long dwFlags, const wchar_t *lpWideCharStr, int cchWideChar,
                            char *lpMultiByteStr, int cbMultiByte, const char *lpDefaultChar, int *lpUsedDefaultChar);
]]
local C = ffi.C
local lstr = ffi.string
local ffit = require "ffitypes"
local chara = ffit.chara
local wchara = ffit.wchara

local wcslen = C.wcslen
local MultiByteToWideChar = C.MultiByteToWideChar
local WideCharToMultiByte = C.WideCharToMultiByte

local CP_UTF8 = 65001

return {
    convtowide = function(str, len)
        len = len or #str + 1 -- we need to add 1 to get valid C string with null-terminator
        local wide = wchara(len)
        MultiByteToWideChar(CP_UTF8, 0, str, len, wide, len)
        return wide
    end,
    convtostr = function(wide, len)
        len = len or wcslen(wide) -- no need to add 1 for null-terminator in _win_convtostr due to copying in ffi.string
        local size = WideCharToMultiByte(CP_UTF8, 0, wide, len, nil, 0, nil, nil)
        local str = chara(size)
        WideCharToMultiByte(CP_UTF8, 0, wide, len, str, size, nil, nil)
        return lstr(str, size)
    end
}
