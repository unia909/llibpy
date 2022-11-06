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
    ll = t"long long",
    llp = t"long long*",
    lla = t"long long[?]",
    ull = t"unsigned long long",
    ullp = t"unsigned long long*",
    ulla = t"unsigned long long[?]",
    charp = t"char*",
    chara = t"char[?]",
    ucharp = t"unsigned char*",
    uchara = t"unsigned char[?]",
    wcharp = t"wchar_t*",
    wchara = t"wchar_t[?]"
}
