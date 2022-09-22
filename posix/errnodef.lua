local ffi = require "ffi"
ffi.cdef[[
    int* __errno_location();
    char* strerror_l(int errnum, void *locale);
]]
return ffi.C.__errno_location()