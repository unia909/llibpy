local ffi = require "ffi"
require "libcdef"
require "win32.winntdef"
local ntstr = require "win32.string"
local C = ffi.C

--local hErr = C.GetStdHandle(-12)
local hOut = C.GetStdHandle(-11)
local hIn = C.GetStdHandle(-10)

return {
    write = function(str)
        local len = #str
        C.WriteConsoleW(hOut, ntstr.convtowide(str, len), len, nil, nil)
    end,
    read = function()
        local size = 4096
        local readed = size
        local read = ffi.cast("DWORD*", C.malloc(4))
        local out = ""
        local buf = ffi.new("wchar_t[?]", size)
        while true do
            C.ReadConsoleW(hIn, buf, size, read, nil)
            out = out..(ntstr.convtostr(buf, size))
            readed = tonumber(read[0])
            if buf[readed - 2] == 13 and buf[readed - 1] == 10 then
                break
            end
        end
        C.free(read)
        return out
    end
}