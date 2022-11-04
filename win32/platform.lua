local ffi = require "ffi"
require "win32.winntdef"
local ntstr = require "win32.string"
local winreg = require "win32.winreg"
local os = require "win32.os"

ffi.cdef [[
    int GetComputerNameW(const wchar_t *lpBuffer, DWORD *nSize);
]]

local releases = {
    ["5.0"] = "2000Professional",
    ["5.1"] = "XPProfessional",
    ["5.2"] = "2003Server",
    ["6.0"] = "VistaProfessional",
    ["6.1"] = "7Professional",
    ["6.2"] = "8Professional",
    ["6.3"] = "8.1Professional",
    ["10.0"] = "10Professional"
}

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
        local reg = winreg.OpenKey(winreg.HKEY_LOCAL_MACHINE, "SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion")
        local curver = winreg.QueryValueEx(reg, "CurrentVersion")

        local buf = ffi.new("wchar_t[15]") -- max computer name size is 15 o_O
        local size = ffi.cast("DWORD*", ffi.C.malloc(4))
        ffi.C.GetComputerNameW(buf, size)
        local nodesize = size[0]
        ffi.C.free(size)

        local out = {
            system = "Windows",
            node = ntstr.convtostr(buf, nodesize),
            release = releases[curver],
            version = curver.."."..winreg.QueryValueEx(reg, "CurrentBuildNumber"),
            machine = jit.arch,
            processor = os.getenv("PROCESSOR_IDENTIFIER")
        }
        winreg.CloseKey(reg)
        return out
    end
}
