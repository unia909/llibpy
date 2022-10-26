local ffi = require "ffi"
local errno = require "posix.errno"
ffi.cdef "signed size_t getrandom(void *buf, size_t buflen, unsigned int flags);"

return function(buf, len)
    if ffi.C.getrandom(buf, len, 0) == -1 then
        error("getrandom error "..errno)
    end
end