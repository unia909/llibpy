local ffi = require "ffi"
ffi.cdef [[
    typedef struct {
        long tv_sec;         /* seconds */
        long tv_usec;        /* microseconds */
    } timeval;
    int select(int n, void *readfds, void *writefds, void *exceptfds, timeval *timeout);
    int clock_gettime(int clk_id, timeval *tp);
]]
local timeval = ffi.typeof"timeval"
local timevala = ffi.typeof"timeval[1]"
local C = ffi.C

return {
    sleep = function(secs)
        local time = timeval(math.floor(secs), secs % 1)
        C.select(0, nil, nil, nil, time)
    end,
    monotonic = function()
        local time = timevala()
        C.clock_gettime(1, time) -- 1 is CLOCK_MONOTONIC
        return tonumber(time[0].tv_sec) + tonumber(time[0].tv_usec) / 1000000000.0
    end
}
