require "posix/posixtypes"
require "posix/errno"
require("ffi").cdef[[
    typedef struct{} DIR;
    enum
    {
        DT_UNKNOWN = 0,
        DT_FIFO = 1,
        DT_CHR = 2,
        DT_DIR = 4,
        DT_BLK = 6,
        DT_REG = 8,
        DT_LNK = 10,
        DT_SOCK = 12,
        DT_WHT = 14
    };
    struct dirent
    {
        __ino_t d_ino;
        __off_t d_off;
        unsigned short int d_reclen;
        unsigned char d_type;
        char d_name[256];
    };
    DIR* opendir(const char *dirname);
    struct dirent* readdir(DIR *dirstream);
    int closedir(DIR *dirstream);
]]