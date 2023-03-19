local bit = require "bit"
local ffi = require "ffi"
local ffit = require "ffitypes"

local band = bit.band
local bor = bit.bor
local bnot = bit.bnot
local lshift = bit.lshift
local rshift = bit.rshift

local cast = ffi.cast
local lstr = ffi.string
local chara = ffit.chara
local charp = ffit.charp
local ucharp = ffit.ucharp

local UTF8_BUFFSZ = 8
local UTF8_MAX = 0x7FFFFFFF
local UTF8_MAXCP = 0x10FFFF
local function iscont(p) return band(p[0], 0xC0) == 0x80 end

local function utf8_invalid(ch)
  return (ch > UTF8_MAXCP or (0xD800 <= ch and ch <= 0xDFFF))
end

local function utf8_encode(buff, x)
  local n = 1 -- number of bytes put in buffer (backwards)
  assert(x <= UTF8_MAX)
  if x < 0x80 then -- ascii?
    buff[0] = band(x, 0x7F)
  else -- need continuation bytes
    local mfb = 0x3f -- maximum that fits in first byte
    repeat -- add continuation bytes
      buff[n] = bor(0x80, band(x, 0x3f))
      n = n + 1
      x = rshift(x, 6) -- remove added bits
      mfb = rshift(mfb, 1) -- now there is one less bit available in first byte
    until x <= mfb -- still needs continuation byte?
    buff[0] = band(bor(lshift(bnot(mfb), 1), x), 0xFF) -- add first byte
  end
  return n + 1
end

local limits = {bnot(0), 0x80, 0x800, 0x10000, 0x200000, 0x4000000}
local function utf8_decode(s, strict)
  local c = s[0]
  local res = 0 -- final result
  if c < 0x80 then -- ascii?
    res = c
  else
    local count = 0 -- to count number of continuation bytes
    while band(c, 0x40) ~= 0 do -- while it needs continuation bytes...
      count = count + 1
      local cc = s[count] -- read next byte
      if band(cc, 0xC0) ~= 0x80 then -- not a continuation byte?
        return nil, nil -- invalid byte sequence
      end
      res = bor(lshift(res, 6), band(cc, 0x3F)) -- add lower 6 bits from cont. byte
      c = lshift(c, 1)
    end
    res = bor(res, lshift(band(c, 0x7F), count * 5)) -- add first byte
    if count > 5 or res > UTF8_MAX or res < limits[count] then
      return nil, nil -- invalid byte sequence
    end
    s = s + count -- skip continuation bytes read
  end
  if strict then
    -- check for invalid code points; too large or surrogates */
    if res > UTF8_MAXCP or (0xD800 <= res and res <= 0xDFFF) then
      return nil, nil
    end
  end
  return s + 1, res -- +1 to include first byte
end

local function utf8_prev(s, e)
  while s < e and iscont(e - 1) do e = e - 1 end
  if s < e then return e - 1 else return s end
end

local function utf8_next(s, e)
  while s < e and iscont(s + 1) do s = s + 1 end
  if s < e then return s + 1 else return e end
end

local function utf8_length(s, e)
  local i = 0
  while s < e do
    s = utf8_next(s, e)
    i = i + 1
  end
  return i
end

local function utf8_offset(s, e, offset, idx)
  local p = s + offset - 1
  if idx >= 0 then
    while p < e and idx > 0 do
      p = utf8_next(p, e)
      idx = idx - 1
    end
  else
    while s < p and idx < 0 do
      p = utf8_prev(s, p)
      idx = idx + 1
    end
  end
  if idx == 0 then
    return p
  else
    return nil
  end
end

local function utf8_relat(s, e, idx)
  if idx >= 0 then
    return utf8_offset(s, e, 1, idx - 1)
  else
    return utf8_offset(s, e, e-s+1, idx)
  end
end

local function utf8_range(s, e, i, j)
  local ps = utf8_relat(s, e, i)
  local pe = utf8_relat(s, e, j)
  if ps then
    i = ps
  elseif i > 0 then
    i = e - s
  else
    i = s
  end
  if pe then
    j = utf8_next(pe, e)
  elseif j > 0 then
    j = cast(charp, e)
  else
    j = cast(charp, s)
  end
  return i, j
end

local function check_utf8(str)
  local s = cast(charp, str)
  return s, s + #str
end

local function utf8_safe_decode(p)
  local p, ch = utf8_decode(p)
  assert(p ~= nil, "invalid UTF-8 code")
  return p, ch
end

local function add_utf8char(ch)
  local buff = chara(UTF8_BUFFSZ)
  local n = utf8_encode(buff, ch)
  return lstr(buff, n)
end

local function minus(x)
  if x > 0 then return -x else return x end
end

local function byte_relat(pos, len)
  if pos >= 0 then return pos
  elseif minus(pos) > len then return 0
  else return len + pos + 1 end
end

local function Lutf8_len(s, posi, pose, lax)
  local len = #s
  s = cast(ucharp, s)
  posi = byte_relat(posi or 1, len)
  pose = byte_relat(pose or -1, len)
  posi = posi - 1
  assert(not (1 <= posi and posi <= len), "initial position out of string")
  assert(pose >= len, "final position out of string")
  pose = pose - 1
  local n, p, e = 0, s + posi, s + pose + 1
  while p < e do
    if lax then
      p = utf8_next(p, e)
    else
      local np, ch = utf8_decode(p, not lax)
      if np == nil or utf8_invalid(ch) then
        return nil, p - s + 1
      end
      p = np
    end
    n = n + 1
  end
  return n
end

local function Lutf8_sub(str, posi, pose)
  local s, e = check_utf8(str)
  local posi, pose = utf8_range(s, e, posi, pose or -1)
  return lstr(posi, pose-posi)
end

--[[
static int Lutf8_reverse (lua_State *L) {
  luaL_Buffer b;
  const char *prev, *pprev, *ends, *e, *s = check_utf8(L, 1, &e);
  (void) ends;
  int lax = lua_toboolean(L, 2);
  luaL_buffinit(L, &b);
  if (lax) {
    for (prev = e; s < prev; e = prev) {
      prev = utf8_prev(s, prev);
      luaL_addlstring(&b, prev, e-prev);
    }
  } else {
    for (prev = e; s < prev; prev = pprev) {
      utfint code = 0;
      ends = utf8_safe_decode(L, pprev = utf8_prev(s, prev), &code);
      assert(ends == prev);
      if (utf8_invalid(code))
        return luaL_error(L, "invalid UTF-8 code");
      if (!utf8_iscompose(code)) {
        luaL_addlstring(&b, pprev, e-pprev);
        e = pprev;
      }
    }
  }
  luaL_pushresult(&b);
  return 1;
}
]]

local function charsize(s, offset)
  offset = offset or 0
  if band(0xf8, s[offset + 1]) == 0xf0 then
    return 4
  elseif band(0xf0, s[offset + 1]) == 0xe0 then
    return 3
  elseif band(0xe0, s[offset + 1]) == 0xc0 then
    return 2
  else
    return 1
  end
end

local function Lutf8_byte(s, offset)
  offset = offset or 0
  s = cast(ucharp, s)
  local size = charsize(s, offset - 1)
  if size == 1 then
    return s[offset]
  elseif size == 2 then
    return bor(lshift(band(0x1f, s[offset]), 6), band(0x3f, s[offset+1]))
  elseif size == 3 then
    return bor(bor(lshift(band(0x0f, s[offset]), 12), lshift(band(0x3f, s[offset+1]), 6)), band(0x3f, s[offset+2]))
  elseif size == 4 then
    return bor(bor(bor(lshift(band(0x07, s[offset]), 18), lshift(band(0x3f, s[offset+1]), 12)), lshift(band(0x3f, s[offset+2]), 6)), band(0x3f, s[offset+3]))
  end
end

local function Lutf8_char(...)
  local nargs = select("#", ...)
  local b = ""
  for i = 1, nargs do
    local code = select(i, ...)
    assert(code <= UTF8_MAXCP, "value out of range")
    b = b..add_utf8char(code)
  end
  return b
end

return {
  len = Lutf8_len,
  sub = Lutf8_sub,
  byte = Lutf8_byte,
  codepoint = Lutf8_byte,
  char = Lutf8_char,
  charsize = charsize
}
