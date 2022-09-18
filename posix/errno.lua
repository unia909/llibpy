local errno = require "posix.errnodef"
return setmetatable({}, {
    __index = function() return errno[0] end,
    __newindex = function(_, value) errno = value end
})