require("ffi").cdef[[
    unsigned long GetLastError();
    void SetLastError(unsigned long dwErrCode);
]]