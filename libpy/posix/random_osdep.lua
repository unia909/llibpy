local ffi = require "ffi"
return function(buf, len)
    local f = io.open("/dev/urandom", "rb")
    ffi.copy(buf, fd:read(len), len)
    f:close()
end