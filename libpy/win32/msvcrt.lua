require "libpy"
local ffi = require "ffi"
local ffit = require "ffitypes"
local ntstr = require "win32.string"
ffi.cdef [[
    int _locking(int fd, int mode, long nbytes);
    int _kbhit();
    int _getch();
    int _getwch();
    int _getche();
    int _getwche();
    int _putch(int c);
    int _putwch(wchar_t c);
    int _ungetch(int c);
    int _ungetwch(int c);
    int _heapmin();
]]
local C = ffi.C
local inta = ffit.inta

return {
    locking = function(fd, mode, nbytes)
        if C._locking(fd, mode, nbytes) == -1 then
            raise(OSError)
        end
    end,
    kbhit = C._kbhit,
    getch = function()
        return bytes(C._getch(), 1)
    end,
    getwch = function()
        local ch = C._getwch()
        local pt = C.malloc(4)
        ffi.copy(pt, inta(1, ch), 4)
        return ntstr.convtostr(pt, 4)
    end,
    getche = function()
        return bytes(C._getche(), 1)
    end,
    getwche = function()
        local ch = C._getwche()
        local pt = C.malloc(4)
        ffi.copy(pt, inta(1, ch), 4)
        return ntstr.convtostr(pt, 4)
    end,
    putch = function(btes)
        C._putch(btes.source[0])
    end,
    putwch = function(s)
        C._putwch(ntstr.convtowide(s, 4)[0])
    end,
    ungetch = C._ungetch,
    ungetwch = C._ungetwch,
    heapmin = C._heapmin
}