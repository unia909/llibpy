local ffi = require "ffi"
local t = ffi.typeof

return {
    short = t"short",
    shortp = t"short*",
    shorta = t"short[?]",
    int = t"int",
    intp = t"int*",
    inta = t"int[?]",
    sizet = t"size_t",
    sizetp = t"size_t*",
    sizeta = t"size_t[?]",
    ulong = t"unsigned long",
    ulongp = t"unsigned long*",
    ulonga = t"unsigned long[?]",
    ull = t"unsigned long long",
    ullp = t"unsigned long long*",
    ulla = t"unsigned long long[?]",
    chara = t"char[?]",
    charp = t"char*",
    uchara = t"unsigned char[?]",
    ucharp = t"unsigned char*",
    wchara = t"wchar_t[?]",
    wcharp = t"wchar_t*"
}
