local ffi = require "ffi"
require "libcdef"
require "win32.winntdef"
ffi.cdef [[
    void Sleep(DWORD dwMilliseconds);
    int QueryPerformanceFrequency(long long *lpFrequency);
    int QueryPerformanceCounter(long long *lpFrequency);
]]
local C = ffi.C
local malloc = C.malloc
local free = C.free
local Sleep = C.Sleep
local QueryPerformanceFrequency = C.QueryPerformanceFrequency
local QueryPerformanceCounter = C.QueryPerformanceCounter
local cast = ffi.cast
local sizeof = ffi.sizeof
local ffit = require "ffitypes"
local ll = ffit.ll
local llp = ffit.llp

return {
    sleep = function(secs)
        Sleep(secs/1000)
    end,
    monotonic = function()
        local freqp = cast(llp, malloc(sizeof(ll)))
        QueryPerformanceFrequency(freqp)
        local freq = tonumber(freqp[0])
        QueryPerformanceCounter(freqp)
        local now = tonumber(freqp[0])
        free(freqp)
        return now / freq
    end
}
