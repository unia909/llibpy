require("ffi").cdef[[
    typedef long unsigned int __ino_t;
    typedef __ino_t ino_t;
    typedef __ino_t __off_t;
    typedef ino_t off_t;
]]