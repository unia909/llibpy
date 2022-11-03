local ntstr = require "win32.string"

return {
    convtowide = function(str, len)
        if str == nil then return nil end
        return ntstr.convtowide(str, len)
    end,
    convtostr = function(wide, len)
        if wide == nil then return nil end
        return ntstr.convtostr(wide, len)
    end
}
