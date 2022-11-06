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
local malloc = C.malloc
local free = C.free
local GetStdHandle = C.GetStdHandle
local WriteConsoleW = C.WriteConsoleW
local ReadConsoleW = C.ReadConsoleW
local convtowide = ntstr.convtowide
local convtostr = ntstr.convtostr

local ffit = require "ffitypes"
local ulongp = ffit.ulongp
local wchara = ffit.wchara

--local hErr = GetStdHandle(-12)
local hOut = GetStdHandle(-11)
local hIn = GetStdHandle(-10)

return {
    write = function(str)
        local len = #str
        WriteConsoleW(hOut, convtowide(str, len), len, nil, nil)
    end,
    read = function()
        local size = 4096
        local readed = size
        local read = cast(ulongp, malloc(4))
        local out = ""
        local buf = wchara(size)
        local cont = true
        while cont do
            ReadConsoleW(hIn, buf, size, read, nil)
            readed = tonumber(read[0])
            if buf[readed - 2] == 13 and buf[readed - 1] == 10 then
                readed = readed - 2
                cont = false
            end
            out = out..convtostr(buf, readed)
        end
        free(read)
        return out
    end
}
