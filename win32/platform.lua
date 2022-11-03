local ffi = require "ffi"
require "win32.winntdef"
local ntstr = require "win32.string"

ffi.cdef [[
    int GetComputerNameW(const wchar_t *lpBuffer, DWORD *nSize);
]]

return {
    machine = function()
        return st.machine
    end,
    node = function()
        return st.node
    end,
    release = function()
        return st.release
    end,
    uname = function()
        local buf = ffi.new("wchar_t[15]") -- max computer name size is 15 o_O
        local size = ffi.cast("DWORD*", ffi.C.malloc(4))
        ffi.C.GetComputerNameW(buf, size)
        local nodesize = size[0]
        ffi.C.free(size)
        return {
            system = "Windows",
            node = ntstr.convtostr(buf, nodesize)
            -- TODO add values
        }
    end
}
