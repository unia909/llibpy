require("ffi").cdef[[
    enum {
        CP_ACP,
        CP_OEMCP,
        CP_MACCP,
        CP_THREAD_ACP,
        CP_SYMBOL = 42,
        CP_UTF7 = 65000,
        CP_UTF8 = 65001
    };

    int MultiByteToWideChar(unsigned int CodePage, unsigned long dwFlags, const char *lpMultiByteStr, int cbMultiByte,
                            wchar_t *lpWideCharStr, int cchWideChar);
    int WideCharToMultiByte(unsigned int CodePage, unsigned long dwFlags, const wchar_t *lpWideCharStr, int cchWideChar,
                            char *lpMultiByteStr, int cbMultiByte, const char *lpDefaultChar, int *lpUsedDefaultChar);
]]