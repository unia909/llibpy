local ffi = require "ffi"
ffi.cdef "void arc4random_buf(void *buf, size_t nbytes);"
local C = ffi.C

return function(buf, len)
    return C.arc4random_buf(buf, len)
end
