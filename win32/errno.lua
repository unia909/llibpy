require "win32.errnodef"
return setmetatable({}, {
    __index = function() return ffi.C.GetLastError() end,
    __newindex = function(_, value) ffi.C.SetLastError(value) end
})