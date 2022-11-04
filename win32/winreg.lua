require "libpy"
local ffi = require "ffi"
local ntstr = require "win32.stringsafe"
local os = require "win32.os"
ffi.cdef [[
    int RegCloseKey(size_t hKey);
    int RegConnectRegistryW(const wchar_t *lpMachineName, size_t hKey, size_t *phkResult);
    int RegCreateKeyW(size_t hKey, const wchar_t *lpSubKey, size_t *phkResult);
    int RegCreateKeyExW(size_t hKey, const wchar_t *lpSubKey, DWORD Reserved, wchar_t *lpClass, DWORD dwOptions, int samDesired,
                        const LPSECURITY_ATTRIBUTES lpSecurityAttributes, size_t *phkResult, DWORD *lpdwDisposition);
    int RegDeleteKeyW(size_t hKey, const wchar_t *lpSubKey);
    //int RegDeleteKeyExW(size_t hKey, const wchar_t *lpSubKey, int samDesired, DWORD Reserved);
    int RegDeleteValueW(size_t hKey, const wchar_t *lpValueName);
    int RegEnumKeyW(size_t hKey, DWORD dwIndex, wchar_t *lpName, DWORD cchName);
    int RegEnumValueW(size_t hKey, DWORD dwIndex, wchar_t *lpValueName, DWORD *lpcchValueName, DWORD *lpReserved, DWORD *lpType,
                      unsigned char *lpData, DWORD *lpcbData);
    DWORD ExpandEnvironmentStringsW(const wchar_t *lpSrc, wchar_t *lpDst, DWORD nSize);
    int RegFlushKey(size_t hKey);
    int RegLoadKeyW(size_t hKey, const wchar_t *lpSubKey, const wchar_t *lpFile);
    int RegOpenKeyExW(size_t hKey, const wchar_t *lpSubKey, DWORD ulOptions, int samDesired, size_t *phkResult);
    int RegQueryInfoKeyW(size_t hKey, wchar_t *lpClass, DWORD *lpcchClass, DWORD *lpReserved, DWORD *lpcSubKeys, DWORD *lpcbMaxSubKeyLen,
                         DWORD *lpcbMaxClassLen, DWORD *lpcValues, DWORD *lpcbMaxValueNameLen, DWORD *lpcbMaxValueLen,
                         DWORD *lpcbSecurityDescriptor, QWORD *lpftLastWriteTime);
    int RegQueryValueW(size_t hKey, const wchar_t *lpSubKey, wchar_t *lpData, int *lpcbData);
    int RegQueryValueExW(size_t hKey, const wchar_t *lpValueName, DWORD *lpReserved, DWORD *lpType, unsigned char *lpData, DWORD *lpcbData);
    int RegSaveKeyW(size_t hKey, const wchar_t *lpFile, const void *lpSecurityAttributes);
    int RegSetValueW(size_t hKey, const wchar_t *lpSubKey, DWORD dwType, const wchar_t *lpData, DWORD cbData);
    int RegSetValueExW(size_t hKey, const wchar_t *lpValueName, DWORD Reserved, DWORD dwType, const unsigned char *lpData, DWORD cbData);
    int RegDisableReflectionKey(size_t hBase);
    int RegEnableReflectionKey(size_t hBase);
    int RegQueryReflectionKey(size_t hBase, int *bIsReflectionDisabled);
]]
local C = ffi.C
local advapi = ffi.load("Advapi32.dll")

local function throwerr(errno)
    errno = errno or ffi.errno()
    error("[WinError "..errno.."] "..os.strerror(errno))
end

local function check(ret, ret_is_errno)
    if ret ~= 0 then
        if ret_is_errno then
            throwerr(ret)
        else
            throwerr()
        end
    end
end

local function OpenKey(key, sub_key, reserved, access)
    local pointer = ffi.cast("size_t*", C.malloc(ffi.sizeof("size_t")))
    check(advapi.RegOpenKeyExW(key, ntstr.convtowide(sub_key), reserved or 0, access or 0x00020019, pointer))
    local ret = pointer[0]
    C.free(pointer)
    return ret
end

local function getdata(_bytes, _type)
    if _type == 1 then
        return ntstr.convtostr(ffi.cast("wchar_t*", _bytes.source))
    elseif _type == 4 then
        return tonumber(ffi.cast("DWORD*", _bytes.source)[0])
    elseif _type == 11 then
        return tonumber(ffi.cast("QWORD*", _bytes.source)[0])
    else
        return buf
    end
end

return {
    CloseKey = function(hKey)
        check(advapi.RegCloseKey(hKey))
    end,
    ConnectRegistry = function(computer_name, key)
        local pointer = ffi.cast("size_t*", C.malloc(ffi.sizeof("size_t")))
        check(advapi.RegConnectRegistryW(ntstr.convtowide(computer_name), key, pointer))
        local ret = pointer[0]
        C.free(pointer)
        return ret
    end,
    CreateKey = function(key, sub_key)
        local pointer = ffi.cast("size_t*", C.malloc(ffi.sizeof("size_t")))
        check(advapi.RegCreateKeyW(key, ntstr.convtowide(sub_key), pointer))
        local ret = pointer[0]
        C.free(pointer)
        return ret
    end,
    CreateKeyEx = function(key, sub_key, reserved, access)
        local pointer = ffi.cast("size_t*", C.malloc(ffi.sizeof("size_t")))
        check(advapi.RegCreateKeyExW(key, ntstr.convtowide(sub_key), reserved or 0, nil, 0, access or 0x00020019, nil, pointer, 0))
        local ret = pointer[0]
        C.free(pointer)
        return ret
    end,
    DeleteKey = function(key, sub_key)
        check(advapi.RegDeleteKeyW(key, ntstr.convtowide(sub_key)))
    end,
    DeleteValue = function(key, value)
        check(advapi.RegDeleteValueW(key, ntstr.convtowide(value)))
    end,
    EnumKey = function(key, index)
        local buf = ffi.new("wchar_t[255]")
        check(advapi.RegEnumKeyW(key, index, buf, 255))
        return ffi.string(buf)
    end,
    EnumValue = function(key, index)
        local valSize = ffi.cast("DWORD*", C.malloc(ffi.sizeof("DWORD")))
        valSize[0] = 32767
        local valName = ffi.new("wchar_t[?]", valSize[0])
        local lpType = ffi.cast("DWORD*", C.malloc(ffi.sizeof("DWORD")))
        local lpSize = ffi.cast("DWORD*", C.malloc(ffi.sizeof("DWORD")))
        check(advapi.RegEnumValueW(key, index, valName, valSize, nil, lpType, nil, lpSize), true)
        valSize[0] = valSize[0] + 1 -- add null-terminator
        local _type = lpType[0]
        C.free(lpType)
        local buf = bytes(lpSize[0])
        check(advapi.RegEnumValueW(key, index, valName, valSize, nil, nil, buf.source, lpSize), true)
        C.free(lpSize)

        local valName = ntstr.convtostr(valName, valSize[0])
        C.free(valSize)

        return valName, getdata(buf, _type), _type
    end,
    ExpandEnvironmentStrings = function(str)
        local wstr = ntstr.convtowide(str)
        local size = C.ExpandEnvironmentStringsW(wstr, nil, 0)
        if size == 0 then
            throwerr("ExpandEnvironmentStrings")
        end
        local buf = ffi.new("wchar_t[?]", size)
        C.ExpandEnvironmentStringsW(wstr, buf, size)
        return ntstr.convtostr(buf, size)
    end,
    FlushKey = function(key)
        check(advapi.RegFlushKey(key))
    end,
    LoadKey = function(key, sub_key, file_name)
        check(advapi.RegLoadKeyW(key, ntstr.convtowide(sub_key), ntstr.convtowide(file_name)))
    end,
    OpenKey = OpenKey,
    OpenKeyEx = OpenKey,
    QueryInfoKey = function(key)
        local lpcSubKeys = ffi.cast("DWORD*", C.malloc(ffi.sizeof("DWORD")))
        local lpcValues = ffi.cast("DWORD*", C.malloc(ffi.sizeof("DWORD")))
        local lpftFileTime = ffi.cast("QWORD*", C.malloc(ffi.sizeof("QWORD")))
        check(advapi.RegQueryInfoKeyW(key, nil, nil, kocSubKeys, nil, nil, lpcValues, nil, nil, nil, lpftFileTime))
        local csk = tonumber(lpcSubKeys[0])
        C.free(lpcSubKeys)
        local cv = tonumber(lpcValues[0])
        C.free(lpcValues)
        local ft = tonumber(lpftFileTime[0])
        C.free(lpftFileTime)
        return csk, cv, ft
    end,
    QueryValue = function(key, sub_key)
        local wsk = ntstr.convtowide(sub_key)
        local size = ffi.cast("int*", C.malloc(ffi.sizeof("int")))
        check(advapi.RegQueryValueW(key, wsk, nil, size))
        local buf = ffi.new("wchar_t[?]", size[0])
        check(advapi.RegQueryValueW(key, wsk, buf, size))
        C.free(size)
        return ntstr.convtostr(buf)
    end,
    QueryValueEx = function(key, value_name)
        local wval = ntstr.convtowide(value_name)
        local lpType = ffi.cast("DWORD*", C.malloc(ffi.sizeof("DWORD")))
        local lpSize = ffi.cast("DWORD*", C.malloc(ffi.sizeof("DWORD")))
        check(advapi.RegQueryValueExW(key, wval, nil, lpType, nil, lpSize))
        local _type = lpType[0]
        C.free(lpType)
        local buf = bytes(lpSize[0])
        check(advapi.RegQueryValueExW(key, wval, nil, nil, buf.source, lpSize))
        C.free(lpSize)

        return getdata(buf, _type), _type
    end,
    SaveKey = function(key, file_name)
        check(advapi.RegSaveKeyW(key, ntstr.convtowide(file_name), nil))
    end,
    SetValue = function(key, sub_key, _type, value)
        check(advapi.RegSetValueW(key, ntstr.convtowide(sub_key), _type, value, #value))
    end,
    SetValueEx = function(key, value_name, reserved, _type, value)
        local _bytes
        local size
        local needFree = false
        if _type == 1 then
            _bytes = ffi.cast("const char*", value)
            size = #value
        elseif _type == 3 then
            _bytes = value.source
            size = #value
        elseif _type == 4 then
            size = ffi.sizeof("DWORD")
            _bytes = ffi.cast("DWORD*", C.malloc(size))
            _bytes[0] = value
            needFree = true
        elseif _type == 11 then
            size = ffi.sizeof("QWORD")
            _bytes = ffi.cast("QWORD*", C.malloc(size))
            _bytes[0] = value
            needFree = true
        end
        check(advapi.RegSetValueExW(key, ntstr.convtowide(value_name), reserved, _type, _bytes, size))
        if needFree then
            C.free(_bytes)
        end
    end,
    DisableReflectionKey = function(key)
        check(advapi.RegDisableReflectionKey(key))
    end,
    EnableReflectionKey = function(key)
        check(advapi.RegEnableReflectionKey(key))
    end,
    QueryReflectionKey = function(key)
        local bRet = ffi.cast("int*", C.malloc(ffi.sizeof("int")))
        check(advapi.RegQueryReflectionKey(key, bRet))
        local ret
        if bRet == 1 then
            ret = true
        else
            ret = false
        end
        C.free(bRet)
        return ret
    end,

    HKEY_CLASSES_ROOT      = 0x80000000,
    HKEY_CURRENT_USER      = 0x80000001,
    HKEY_LOCAL_MACHINE     = 0x80000002,
    HKEY_USERS             = 0x80000003,
    HKEY_PERFORMANCE_DATA  = 0x80000004,
    HKEY_CURRENT_CONFIG    = 0x80000005,
    HKEY_DYN_DATA          = 0x80000006,
    KEY_ALL_ACCESS         = 0x000F003F,
    KEY_WRITE              = 0x00020006,
    KEY_READ               = 0x00020019,
    KEY_EXECUTE            = 0x00020019,
    KEY_QUERY_VALUE        = 0x00000001,
    KEY_SET_VALUE          = 0x00000002,
    KEY_CREATE_SUB_KEY     = 0x00000004,
    KEY_ENUMERATE_SUB_KEYS = 0x00000008,
    KEY_NOTIFY             = 0x00000010,
    KEY_CREATE_LINK        = 0x00000020,
    KEY_WOW64_64KEY        = 0x00000100,
    KEY_WOW64_32KEY        = 0x00000200,

    REG_NONE                       = 0,
    REG_SZ                         = 1,
    REG_EXPAND_SZ                  = 2,
    REG_BINARY                     = 3,
    REG_DWORD                      = 4,
    REG_DWORD_LITTLE_ENDIAN        = 4,
    REG_DWORD_BIG_ENDIAN           = 5,
    REG_LINK                       = 6,
    REG_MULTI_SZ                   = 7,
    REG_RESOURCE_LIST              = 8,
    REG_FULL_RESOURCE_DESCRIPTOR   = 9,
    REG_RESOURCE_REQUIREMENTS_LIST = 10,
    REG_QWORD                      = 11,
    REG_QWORD_LITTLE_ENDIAN        = 11
}