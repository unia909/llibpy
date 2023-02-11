local os = require "posix.os"
local st = os.uname()

return {
    machine = function()
        return st.machine
    end,
    node = function()
        return st.node
    end,
    release = function()
        return st.release
    end,
    uname = function()
        local lst = os.uname()
        return {
            system = lst.sysname,
            node = lst.nodename,
            release = lst.release,
            version = lst.version,
            machine = lst.machine
        }
    end
}
