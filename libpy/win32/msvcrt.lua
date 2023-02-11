require "libpy"
local ffi = require "ffi"
local ntstr = require "win32.string"
ffi.cdef [[
    int _getch();
    int _getwch();
    int _getche();
    int _getwche();
    int _putch(int c);
    int _putwch(wchar_t c);
]]
local C = ffi.C

return {
    getch = function()
        return bytes(C._getch(), 1)
    end,
    getwch = function()
        local ch = C._getwch()
        local pt = C.malloc(4)
        ffi.copy(pt, ffi.new("int[1]", ch), 4)
        return ntstr.convtostr(pt, 4)
    end,
    getche = function()
        return bytes(C._getche(), 1)
    end,
    getwche = function()
        local ch = C._getwche()
        local pt = C.malloc(4)
        ffi.copy(pt, ffi.new("int[1]", ch), 4)
        return ntstr.convtostr(pt, 4)
    end,
    putch = function(btes)
        C._putch(btes.source[0])
    end,
    putwch = function(s)
        C._putwch(ntstr.convtowide(s, 4)[0])
    end
}