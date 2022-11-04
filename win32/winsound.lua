local ffi = require "ffi"
local ntstr = require "win32.string"
require "win32.winntdef"
ffi.cdef [[
    int Beep(DWORD dwFreq, DWORD dwDuration);
    int PlaySoundW(const void *pszSoundW, void *hmod, DWORD fdwSound);
    int MessageBeep(unsigned int uType);
]]
local C = ffi.C

return {
    Beep = C.Beep,
    PlaySound = function(sound, flags)
        if type(sound) == "string" then
            sound = ntstr.convtowide(sound)
        else
            sound = sound.source
        end
        return C.PlaySound(sound, nil, flags)
    end,
    MessageBeep = function(t)
        return C.MessageBeep(t or 0)
    end,
    SND_SYNC = 0,
    SND_ASYNC = 1,
    SND_NODEFAULT = 2,
    SND_MEMORY = 4,
    SND_LOOP = 8,
    SND_NOSTOP = 16,
    SND_NOWAIT = 0x2000,
    SND_ALIAS = 0x10000,
    SND_FILENAME = 0x20000,
    SND_PURGE = 0x40,
    MB_SIMPLEBEEP = 0xFFFFFFFF,
    MB_ICONASTERISK = 0x40,
    MB_ICONEXCLAMATION = 0x30,
    MB_ICONERROR = 0x10,
    MB_ICONHAND = 0x10,
    MB_ICONINFORMATION = 0x40,
    MB_ICONQUESTION = 0x20,
    MB_ICONSTOP = 0x10,
    MB_ICONWARNING = 0x30,
    MB_OK = 0
}
