local ffi = require "ffi"
ffi.cdef "int getrandom(void *buf, size_t buflen, unsigned int flags);"

return function(buf, len)
    if ffi.C.getrandom(buf, len, 0) == -1 then
        error("getrandom error "..ffi.errno())
    end
end
