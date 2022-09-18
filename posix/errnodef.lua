local ffi = require "ffi"
require "posix.posixtypes"
ffi.cdef[[
    int* __errno_location();
    char* strerror_l(int errnum, locale_t locale);
]]
return ffi.C.__errno_location()