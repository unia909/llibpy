local ffi = require "ffi"
require "win32.winntdef"
ffi.cdef [[
    int GetComputerNameW(const wchar_t *lpBuffer, DWORD *nSize);
]]
local C = ffi.C

local ntstr = require "win32.string"
local winreg = require "win32.winreg"
local ffit = require "ffitypes"
local ulonga = ffit.ulonga
local wchara = ffit.wchara

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
    local buf = wchara(15) -- max computer name size is 15 o_O
    local size = ulonga(1, 15)
    C.GetComputerNameW(buf, size)
    return ntstr.convtostr(buf, size[0])
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
