local time
if jit.os ~= "Windows" then
    time = require "posix.time"
else
    time = require "win32.time"
end

time.time = os.time
time.strftime = os.date
time.process_time = os.clock
time.perf_counter = time.monotonic
function time.get_clock_info(name)
    if name == "monotonic" then
        return time.monotonic()
    elseif name == "perf_counter" then
        return time.monotonic()
    elseif name == "process_time" then
        return os.clock()
    elseif name == "thread_time" then
        error("time.get_clock_info: NotSupported name thread_time")
    elseif name == "time" then
        return os.time()
    else
        error("ValueError: unknown clock")
    end
end

return time
