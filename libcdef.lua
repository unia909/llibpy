require("ffi").cdef[[
    size_t strlen(const char *string);
    const char* strstr(const char *string1, const char *string2);
    char* strcpy(char *destptr, const char *srcptr);
    char* strncpy(char *destptr, const char *srcptr, size_t num);
    size_t wcslen(const wchar_t *str);
    void* malloc(size_t sizemem);
    void free(void* ptrmem);
]]