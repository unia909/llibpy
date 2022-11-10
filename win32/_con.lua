local ffi = require "ffi"
require "libcdef"
require "win32.winntdef"
ffi.cdef [[
    void* GetStdHandle(DWORD nStdHandle);
    int WriteConsoleW(void *hConsoleOutput, const void *lpBuffer, DWORD nNumberOfCharsToWrite, DWORD *lpNumberOfCharsWritten, void *lpReserved);
    int ReadConsoleW(void *hConsoleInput, void *lpBuffer, DWORD nNumberOfCharsToRead, DWORD *lpNumberOfCharsRead, void *pInputControl);
]]
local ntstr = require "win32.string"
local cast = ffi.cast
local C = ffi.C

local ffit = require "ffitypes"
local ulongp = ffit.ulongp
local wchara = ffit.wchara

--local hErr = C.GetStdHandle(-12)
local hOut = C.GetStdHandle(-11)
local hIn = C.GetStdHandle(-10)

return {
    write = function(str)
        local len = #str
        local wide = ntstr.convtowide(str, len)
        local wlen = C.wcslen(wide)
        C.WriteConsoleW(hOut, , len, nil, nil)
    end,
    read = function()
        local size = 4096
        local readed = size
        local read = cast(ulongp, C.malloc(4))
        local out = ""
        local buf = wchara(size)
        local cont = true
        while cont do
            C.ReadConsoleW(hIn, buf, size, read, nil)
            readed = tonumber(read[0])
            if buf[readed - 2] == 13 and buf[readed - 1] == 10 then
                readed = readed - 2
                cont = false
            end
            out = out..ntstr.convtostr(buf, readed)
        end
        C.free(read)
        return out
    end
}
