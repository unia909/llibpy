local ffi = require "ffi"
ffi.cdef "void arc4random_buf(void *buf, size_t nbytes);"

return function(buf, len)
    return ffi.C.arc4random_buf(buf, len)
end