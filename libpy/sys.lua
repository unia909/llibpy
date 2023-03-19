local ffi = require "ffi"
ffi.cdef [[
    typedef struct {
        int major, minor, micro;
        const char *releaselevel;
        int serial;
    } version_info_t;
]]
local version_info = ffi.new("version_info_t", 3, 11, 2, "final", 0)
local version = "3.11.2 (main) ["..jit.version.."]"
local maxsize
if ffi.abi("32bit") then
    maxsize = 2147483647
elseif ffi.abi("64bit") then
    maxsize = 9223372036854775807
else
    -- 16bit???
    maxsize = 32767
end

local byteorder
if ffi.abi("le") then
    byteorder = "little"
else
    byteorder = "big"
end

return {
    abiflags = "",
    argv = arg,
    byteorder = byteorder,
    modules = package.loaded,
    copyright = [[Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>
All Rights Reserved.
]],
    exit = function(arg)
        if arg == nil then
            os.exit(0)
        elseif type(arg) == "number" then
            os.exit(arg)
        else
            print(arg)
            os.exit(1)
        end
    end,
    executable = arg[0],
    float_info = {
        epsilon = 1E-9,
        dig = 10,
        mant_dig = 53,
        max = 1E+37,
        max_exp = 1024,
        max_10_exp = 37,
        min = 1E-37,
        min_exp = -1021,
        min_10_exp = -37,
        radix = 2,
        rounds = 0
    },
    hexversion = 0x030b00f0,
    implementation = {
        name = "lython",
        version = version_info
    },
    maxsize = maxsize,
    maxunicode = 0x10FFFF,
    modules = package.loaded,
    orig_argv = arg,
    ps1 = ">>> ",
    ps2 = "... ",
    version = version,
    version_info = version_info,
    winver = "3.11",
    warnoptions = {}
}
