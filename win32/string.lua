local ffi = require "ffi"
require "libcdef"
require "win32.winntdef"
local C = ffi.C

return {
    convtowide = function(str, len)
        len = len or #str + 1 -- we need to add 1 to get valid C string with null-terminator
        local wide = ffi.new("wchar_t[?]", len)
        C.MultiByteToWideChar(C.CP_UTF8, 0, str, len, wide, len)
        return wide
    end,
    convtostr = function(wide, len)
        len = len or C.wcslen(wide) -- no need to add 1 for null-terminator in _win_convtostr due to copying in ffi.string
        local size = C.WideCharToMultiByte(C.CP_UTF8, 0, wide, len, nil, 0, nil, nil)
        local str = ffi.new("char[?]", size)
        C.WideCharToMultiByte(C.CP_UTF8, 0, wide, len, str, size, nil, nil)
        return ffi.string(str, size)
    end
}
