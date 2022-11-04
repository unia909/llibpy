local ffi = require "ffi"
ffi.cdef "void arc4random_buf(void *buf, size_t nbytes);"
local arc4random_buf = ffi.C.arc4random_buf

return function(buf, len)
    return arc4random_buf(buf, len)
end
