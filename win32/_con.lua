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
local malloc = C.malloc
local free = C.free
local GetStdHandle = C.GetStdHandle
local WriteConsoleW = C.WriteConsoleW
local ReadConsoleW = C.ReadConsoleW

local ffit = require "ffitypes"
local wchara = ffit.wchara

--local hErr = GetStdHandle(-12)
local hOut = GetStdHandle(-11)
local hIn = GetStdHandle(-10)

return {
    write = function(str)
        local len = #str
        WriteConsoleW(hOut, ntstr.convtowide(str, len), len, nil, nil)
    end,
    read = function()
        local size = 4096
        local readed = size
        local read = ffi.cast("DWORD*", malloc(4))
        local out = ""
        local buf = wchara(size)
        while true do
            ReadConsoleW(hIn, buf, size, read, nil)
            out = out..(ntstr.convtostr(buf, size))
            readed = tonumber(read[0])
            if buf[readed - 2] == 13 and buf[readed - 1] == 10 then
                break
            end
        end
        free(read)
        return out
    end
}
