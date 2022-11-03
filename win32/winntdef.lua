require("ffi").cdef[[
    typedef unsigned short WORD;
    typedef unsigned long DWORD;
    typedef unsigned long long QWORD;

    typedef char *PSTR;
    typedef const char *PCSTR;
    typedef wchar_t *PWSTR;
    typedef const wchar_t *PCWSTR;

    int CloseHandle(void *hObject);
    void* GetStdHandle(DWORD nStdHandle);
    int WriteConsoleW(void *hConsoleOutput, const void *lpBuffer, DWORD nNumberOfCharsToWrite, DWORD *lpNumberOfCharsWritten, void *lpReserved);
    int ReadConsoleW(void *hConsoleInput, void *lpBuffer, DWORD nNumberOfCharsToRead, DWORD *lpNumberOfCharsRead, void *pInputControl);
    void ExitProcess(unsigned int uExitCode);
    DWORD FormatMessageW(DWORD dwFlags, const void *lpSource, DWORD dwMessageId, DWORD dwLanguageId, wchar_t **lpBuffer, DWORD nSize, va_list *Arguments);
    void* LocalFree(void *hMem);

    enum {
        MAX_PATH = 260,
        ERROR_NO_MORE_FILES = 18,
        ERROR_ENVVAR_NOT_FOUND = 203,
        INVALID_HANDLE_VALUE = 0xffffffff,

        TH32CS_SNAPHEAPLIST = 0x00000001,
        TH32CS_SNAPPROCESS  = 0x00000002,
        TH32CS_SNAPTHREAD   = 0x00000004,
        TH32CS_SNAPMODULE   = 0x00000008,
        TH32CS_SNAPMODULE32 = 0x00000010
    };

    typedef struct {
        DWORD dwLowDateTime;
        DWORD dwHighDateTime;
    } FILETIME;

    typedef struct {
        DWORD    dwFileAttributes;
        FILETIME ftCreationTime;
        FILETIME ftLastAccessTime;
        FILETIME ftLastWriteTime;
        DWORD    nFileSizeHigh;
        DWORD    nFileSizeLow;
        DWORD    dwReserved0;
        DWORD    dwReserved1;
        wchar_t  cFileName[MAX_PATH];
        wchar_t  cAlternateFileName[14];
        DWORD    dwFileType; // Obsolete. Do not use.
        DWORD    dwCreatorType; // Obsolete. Do not use
        WORD     wFinderFlags; // Obsolete. Do not use
    } WIN32_FIND_DATAW;

    void* FindFirstFileW(PCWSTR lpFileName, WIN32_FIND_DATAW *lpFindFileData);
    int FindNextFileW(void *hFindFile, WIN32_FIND_DATAW *lpFindFileData);
    int FindClose(void *hFindFile);

    typedef struct {
        DWORD     dwSize;
        DWORD     cntUsage;
        DWORD     th32ProcessID;
        DWORD    *th32DefaultHeapID;
        DWORD     th32ModuleID;
        DWORD     cntThreads;
        DWORD     th32ParentProcessID;
        long      pcPriClassBase;
        DWORD     dwFlags;
        char      szExeFile[MAX_PATH];
    } PROCESSENTRY32;

    void* CreateToolhelp32Snapshot(DWORD dwFlags, DWORD th32ProcessID);
    int Process32First(void *hSnapshot, PROCESSENTRY32 *lppe);
    int Process32Next(void *hSnapshot, PROCESSENTRY32 *lppe);

    DWORD GetEnvironmentVariableW(const wchar_t *lpName, wchar_t *lpBuffer, DWORD nSize);
    int SetEnvironmentVariableW(const wchar_t *lpName, const wchar_t *lpValue);

    int GetCurrentProcessId();

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
