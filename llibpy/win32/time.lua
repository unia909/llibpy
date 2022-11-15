local ffi = require "ffi"
require "libcdef"
require "win32.winntdef"
ffi.cdef [[
    void Sleep(DWORD dwMilliseconds);
    int QueryPerformanceFrequency(long long *lpFrequency);
    int QueryPerformanceCounter(long long *lpFrequency);
]]
local C = ffi.C
local cast = ffi.cast
local sizeof = ffi.sizeof
local ffit = require "ffitypes"
local ll = ffit.ll
local llp = ffit.llp

return {
    sleep = function(secs)
        C.Sleep(secs*1000)
    end,
    monotonic = function()
        local freqp = cast(llp, C.malloc(sizeof(ll)))
        C.QueryPerformanceFrequency(freqp)
        local freq = tonumber(freqp[0])
        C.QueryPerformanceCounter(freqp)
        local now = tonumber(freqp[0])
        C.free(freqp)
        return now / freq
    end
}
