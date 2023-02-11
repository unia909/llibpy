local ffi = require "ffi"
require "libcdef"
require "win32.winntdef"
ffi.cdef [[
    void* GetStdHandle(DWORD nStdHandle);
    int WriteConsoleW(void *hConsoleOutput, const void *lpBuffer, DWORD nNumberOfCharsToWrite, DWORD *lpNumberOfCharsWritten, void *lpReserved);
    int ReadConsoleW(void *hConsoleInput, void *lpBuffer, DWORD nNumberOfCharsToRead, DWORD *lpNumberOfCharsRead, void *pInputControl);
]]
local ntstr = require "win32.string"
local C = ffi.C

local ffit = require "ffitypes"

--local hErr = C.GetStdHandle(-12)
local hOut = C.GetStdHandle(-11)
local hIn = C.GetStdHandle(-10)

return {
    write = function(str)
        local wide = ntstr.convtowide(str)
        local wlen = C.wcslen(wide)
        C.WriteConsoleW(hOut, wide, wlen, nil, nil)
    end,
    read = function()
        local size = 4096
        local readed = size
        local read = ffit.ulonga(1)
        local out = ""
        local buf = ffit.wchara(size)
        while true do
            C.ReadConsoleW(hIn, buf, size, read, nil)
            readed = tonumber(read[0])
            if buf[readed - 2] == 13 and buf[readed - 1] == 10 then
                return out..ntstr.convtostr(buf, readed - 2)
            end
            out = out..ntstr.convtostr(buf, readed)
        end
    end
}
