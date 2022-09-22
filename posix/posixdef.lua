require("ffi").cdef[[
    enum
    {
        DT_UNKNOWN,
        DT_FIFO,
        DT_CHR,
        DT_DIR = 4,
        DT_BLK = 6,
        DT_REG = 8,
        DT_LNK = 10,
        DT_SOCK = 12,
        DT_WHT = 14,

        SIGINT = 2,
        SIGQUIT,
        SIGILL,
        SIGTRAP,
        SIGABRT,
        SIGFPE = 8,
        SIGKILL,
        SIGSEGV = 11,
        SIGPIPE = 13,
        SIGALRM,
        SIGTERM
    };
    struct dirent
    {
        size_t d_ino;
        size_t d_off;
        unsigned short int d_reclen;
        unsigned char d_type;
        char d_name[256];
    };
    void *opendir(const char *dirname);
    struct dirent *readdir(void *dirstream);
    int closedir(void *dirstream);

    int getpid();
    int getppid();
    int kill(int pid, int sig);

    char *getenv(const char *envname);

    void *newlocale(int category_mask, const char *locale, void *base);
]]