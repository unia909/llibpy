local bit = require "bit"
local ffi = require "ffi"
local ffit = require "ffitypes"

local band = bit.band
local bor = bit.bor
local bnot = bit.bnot
local lshift = bit.lshift
local rshift = bit.rshift

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
    buff[UTF8_BUFFSZ - 1] = band(x, 0x7F)
  else -- need continuation bytes
    local mfb = 0x3f -- maximum that fits in first byte
    while true do -- add continuation bytes
      buff[UTF8_BUFFSZ - n] = bor(0x80, band(x, 0x3f))
      n = n + 1
      x = rshift(x, 6) -- remove added bits
      mfb = rshift(mfb, 1) -- now there is one less bit available in first byte
      if x > mfb then break end -- still needs continuation byte?
    end
    buff[UTF8_BUFFSZ - n] = band(bor(lshift(bnot(mfb), 1), x), 0xFF); -- add first byte
  end
  return n
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
  s = ffi.cast(ucharp, s)
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

return {
  len = Lutf8_len
}
