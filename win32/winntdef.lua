local ffi = require("ffi")
ffi.cdef[[
    typedef unsigned short WORD;
    typedef unsigned long DWORD;

    typedef unsigned long *ULONG_PTR;

    typedef char *PSTR;
    typedef const char *PCSTR;
    typedef wchar_t *PWSTR;
    typedef const wchar_t *PCWSTR;

    int CloseHandle(void *hObject);
    void* GetStdHandle(DWORD nStdHandle);
    int WriteConsoleW(void *hConsoleOutput, const void *lpBuffer, DWORD nNumberOfCharsToWrite, DWORD *lpNumberOfCharsWritten, void *lpReserved);
    void ExitProcess(unsigned int uExitCode);
    DWORD FormatMessageW(DWORD dwFlags, const void *lpSource, DWORD dwMessageId, DWORD dwLanguageId, wchar_t **lpBuffer, DWORD nSize, va_list *Arguments);
    void* LocalFree(void *hMem);

    enum {
        MAX_PATH = 260,
        INVALID_HANDLE_VALUE = 0xffffffff,

        TH32CS_SNAPHEAPLIST = 0x00000001,
        TH32CS_SNAPPROCESS = 0x00000002,
        TH32CS_SNAPTHREAD = 0x00000004,
        TH32CS_SNAPMODULE = 0x00000008,
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
        ULONG_PTR th32DefaultHeapID;
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

    // not currently in use
    int GetCurrentProcessId();
    void* GetCurrentProcess();
    long NtQueryInformationProcess(void *ProcessHandle, DWORD ProcessInformationClass, void *ProcessInformation,
                                             DWORD ProcessInformationLength, DWORD *ReturnLength);
]]
--NtDll = ffi.load("NTDLL.DLL")

require "win32.winntstringapisetdef"
require "win32.winerror"