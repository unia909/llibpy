require("ffi").cdef[[
    typedef unsigned short WORD;
    typedef unsigned long DWORD;

    typedef char* PSTR;
    typedef const char* PCSTR;
    typedef wchar_t* PWSTR;
    typedef const wchar_t* PCWSTR;

    DWORD GetLastError();

    enum {
        MAX_PATH = 260
    };

    typedef struct _FILETIME {
        DWORD dwLowDateTime;
        DWORD dwHighDateTime;
    } FILETIME, *PFILETIME;

    typedef struct _WIN32_FIND_DATAW {
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
      } WIN32_FIND_DATAW, *PWIN32_FIND_DATAW;

      void* FindFirstFileW(PCWSTR lpFileName, PWIN32_FIND_DATAW lpFindFileData);
      int FindNextFileW(void* hFindFile, PWIN32_FIND_DATAW lpFindFileData);
      int FindClose(void* hFindFile);
]]
INVALID_HANDLE_VALUE = 0xffffffff

require "win32.winntstringapisetdef"
require "win32.winerror"