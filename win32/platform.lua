local ffi = require "ffi"
require "win32.winntdef"
local ntstr = require "win32.string"
local winreg = require "win32.winreg"

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

local function node()
    local buf = ffi.new("wchar_t[15]") -- max computer name size is 15 o_O
    local size = ffi.cast("DWORD*", ffi.C.malloc(4))
    ffi.C.GetComputerNameW(buf, size)
    local nodesize = size[0]
    ffi.C.free(size)
    return ntstr.convtostr(buf, nodesize)
end

local reg = winreg.OpenKey(winreg.HKEY_LOCAL_MACHINE, "SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion")
local curver = winreg.QueryValueEx(reg, "CurrentVersion")
local ver = curver.."."..winreg.QueryValueEx(reg, "CurrentBuildNumber")
winreg.CloseKey(reg)
local rel = releases[curver]
local processor = require("win32.os").getenv("PROCESSOR_IDENTIFIER")

return {
    machine = function()
        return jit.arch
    end,
    node = node,
    release = function()
        return rel
    end,
    uname = function()
        return {
            system = "Windows",
            node = node(),
            release = rel,
            version = ver,
            machine = jit.arch,
            processor = processor
        }
    end
}
