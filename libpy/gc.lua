return {
    enable = function()
        collectgarbage("restart")
    end,
    disable = function()
        collectgarbage("stop")
    end,
    isenabled = function()
        return collectgarbage("isrunning")
    end,
    collect = function(generation)
        if generation >= 2 then
            while not collectgarbage("step") do end
            return
        elseif generation == 1 then
            collectgarbage("step", 10)
        else
            collectgarbage("step")
        end
    end,
    set_debug = function(flags)
        -- Stub
    end,
    get_debug = function()
        -- Stub
        return 0
    end,
    get_objects = function(generation)
        return {}
    end,
    get_stats = function()
        -- Stub
        return {}
    end,
    set_threshold = function(threshold0, threshold1, threshold2)
        collectgarbage("setstepmul", threshold2 or threshold1 or threshold0 or 0)
    end,
    get_count = function()
        local cnt = collectgarbage("count")
        return cnt, cnt, cnt
    end,
    get_threshold = function()
        return 700, 10, 10 -- default values
    end,
    get_referrers = function()
        -- Stub
        return {}
    end,
    get_referents = function()
        -- Stub
        return {}
    end,
    is_tracked = function()
        -- Stub
        return false
    end,
    is_finalized = function()
        -- Stub
        return false
    end,
    freeze = function()
        -- Stub
    end,
    unfreeze = function()
        -- Stub
    end,
    get_freeze_count = function()
        -- Stub
        return 0
    end,

    DEBUG_STATS = 1,
    DEBUG_COLLECTABLE = 2,
    DEBUG_UNCOLLECTABLE = 4,
    DEBUG_SAVEALL = 32,
    DEBUG_LEAK = 38
}