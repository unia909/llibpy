local ffi = require "ffi"
require "libcdef"
ffi.cdef [[
    struct timeval {
        long tv_sec;         /* seconds */
        long tv_usec;        /* microseconds */
    };
    int select(int n, void *readfds, void *writefds, void *exceptfds, struct timeval *timeout);
    int clock_gettime(int clk_id, struct timeval *tp);
]]
local cast = ffi.cast
local sizeof = ffi.sizeof
local timeval = ffi.typeof"struct timeval"
local timevalp = ffi.typeof"struct timeval*"
local C = ffi.C
local malloc = C.malloc
local free = C.free
local select = C.select
local clock_gettime = C.clock_gettime

return {
    sleep = function(secs)
        local time = timeval(math.floor(secs), secs % 1)
        select(0, nil, nil, nil, time)
    end,
    monotonic = function()
        local timep = cast(timevalp, malloc(sizeof(timeval)))
        clock_gettime(1, timep) -- 1 is CLOCK_MONOTONIC
        local time = timep[0]
        time = tonumber(time.tv_sec) + tonumber(time.tv_usec) / 1000000000.0
        free(timep)
        return time
    end
}
