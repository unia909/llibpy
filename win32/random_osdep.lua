local ffi = require "ffi"
require "win32.winntdef"
require "libcdef"
ffi.cdef[[
    int CryptAcquireContextA(size_t *phProv, const char *szContainer, const char *szProvider, DWORD dwProvType, DWORD dwFlags);
    int CryptGenRandom(size_t hProv, DWORD dwLen, void *pbBuffer);
    int CryptReleaseContext(size_t hProv, DWORD dwFlags);
]]
local advapi = ffi.load("Advapi32.dll")

local phandle = ffi.cast("size_t*", ffi.C.malloc(ffi.sizeof("size_t")))
if advapi.CryptAcquireContextA(phandle, nil, nil, 1, 0xF0000040) == 0 then
    local err = ffi.errno()
    if err == 0x80090016 then -- 0x80090016 is NTE_BAD_KEYSET
        if advapi.CryptAcquireContextA(handle, 0, 0, 1, 0xF0000048) == 0 then -- 8 is CRYPT_NEWKEYSET
            error("Error creating new crypto keyset. Error "..ffi.errno()) -- bad, but how did Windows start?
        end
    else
        error("Error acquiring crypt context. Error "..err)
    end
end

return setmetatable({}, {
    __call = function(self, buf, len)
        advapi.CryptGenRandom(phandle[0], len, buf)
    end,
    __gc = function()
        advapi.CryptReleaseContext(phandle[0], 0)
        ffi.C.free(phandle)
    end
})
