local ffi = require "ffi"
local os = require "./os"
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

local function node()
    local buf = wchara(16) -- max computer name size is 16 o_O
    local size = ulonga(1, 16)
    C.GetComputerNameW(buf, size)
    return ntstr.convtostr(buf, size[0])
end

local function win32_edition()
    local key = winreg.OpenKeyEx(winreg.HKEY_LOCAL_MACHINE, "SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion")
    local edition = winreg.QueryValueEx(key, "EditionId")
    winreg.CloseKey(key)
    return edition
end

local reg = winreg.OpenKey(winreg.HKEY_LOCAL_MACHINE, "SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion")
local currentVersion = winreg.QueryValueEx(reg, "CurrentVersion")
local buildNumber = tonumber(winreg.QueryValueEx(reg, "CurrentBuildNumber"), 10)
winreg.CloseKey(reg)
local processor = os.getenv("PROCESSOR_IDENTIFIER")

local function release()
    if buildNumber >= 22000 then
        return "11"
    elseif buildNumber > 9600 then
        return "10"
    end
    return currentVersion
end

local function version()
    local rel = release()
    if tonumber(rel) >= 10 then
        rel = rel..".0"
    end
    return rel.."."..buildNumber
end

return {
    machine = function()
        local machine = jit.arch
        if machine == "x64" then
            return "x86_64"
        end
        return machine
    end,
    node = node,
    release = release,
    version = version,
    uname = function()
        return {
            system = "Windows",
            node = node(),
            release = release(),
            version = version(),
            machine = jit.arch,
            processor = processor
        }
    end,
    win32_edition = win32_edition,
    win32_is_iot = function()
        local edition = win32_edition()
        return edition:find("IoTUAP", 1, true) or
               edition:find("NanoServer", 1, true) or
               edition:find("WindowsCoreHeadless", 1, true) or
               edition:find("IoTEdgeOS", 1, true)
    end,
    win32_ver = function()
        local ntoskrnl_type
        if os.cpu_count() == 1 then
            ntoskrnl_type = "Uniprocessor Free"
        else
            ntoskrnl_type = "Multiprocessor Free"
        end
        return release(), version(), "SP0", ntoskrnl_type
    end
}
