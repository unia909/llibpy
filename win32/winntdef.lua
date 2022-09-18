local ffi = require("ffi")
ffi.cdef[[
    typedef unsigned short WORD;
    typedef unsigned long DWORD;

    typedef unsigned long *ULONG_PTR;

    typedef char* PSTR;
    typedef const char* PCSTR;
    typedef wchar_t* PWSTR;
    typedef const wchar_t* PCWSTR;

    DWORD __stdcall GetLastError();
    int __stdcall CloseHandle(void *hObject);

    enum {
        MAX_PATH = 260
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

    void* __stdcall FindFirstFileW(PCWSTR lpFileName, WIN32_FIND_DATAW *lpFindFileData);
    int __stdcall FindNextFileW(void *hFindFile, WIN32_FIND_DATAW *lpFindFileData);
    int __stdcall FindClose(void *hFindFile);

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

    void* __stdcall CreateToolhelp32Snapshot(DWORD dwFlags, DWORD th32ProcessID);
    int __stdcall Process32First(void *, PROCESSENTRY32*);
    int __stdcall Process32Next(void *, PROCESSENTRY32*);

    // not currently in use
    int __stdcall GetCurrentProcessId();
    void* __stdcall GetCurrentProcess();
    long __stdcall NtQueryInformationProcess(void *ProcessHandle, DWORD ProcessInformationClass, void *ProcessInformation,
                                             DWORD ProcessInformationLength, DWORD *ReturnLength);
]]
NtDll = ffi.load("NTDLL.DLL")
INVALID_HANDLE_VALUE = 0xffffffff

TH32CS_SNAPHEAPLIST = 0x00000001
TH32CS_SNAPPROCESS = 0x00000002
TH32CS_SNAPTHREAD = 0x00000004
TH32CS_SNAPMODULE = 0x00000008
TH32CS_SNAPMODULE32 = 0x00000010

require "win32.winntstringapisetdef"
require "win32.winerror"