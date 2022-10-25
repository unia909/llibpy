return {
    time = os.time,
    strftime = os.date,
    process_time = os.clock,
    get_clock_info = function(name)
        if name == "monotonic" then
            error("time.get_clock_info: NotSupported name monotonic")
        elseif name == "perf_counter" then
            error("time.get_clock_info: NotSupported name perf_counter")
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
}