--[[Conversion functions between RGB and other color systems.
This modules provides two functions for each color system ABC:
  rgb_to_abc(r, g, b) --> a, b, c
  abc_to_rgb(a, b, c) --> r, g, b
All inputs and outputs are triples of floats in the range [0.0...1.0]
(with the exception of I and Q, which covers a slightly larger range).
Inputs outside the valid range may cause exceptions or invalid outputs.
Supported color systems:
RGB: Red, Green, Blue components
YIQ: Luminance, Chrominance (used by composite video signals)
HLS: Hue, Luminance, Saturation
HSV: Hue, Saturation, Value
]]

-- References:
-- http://en.wikipedia.org/wiki/YIQ
-- http://en.wikipedia.org/wiki/HLS_color_space
-- http://en.wikipedia.org/wiki/HSV_color_space

-- Some floating point constants

local ONE_THIRD = 1.0/3.0
local ONE_SIXTH = 1.0/6.0
local TWO_THIRD = 2.0/3.0

-- YIQ: used by composite video signals (linear combinations of RGB)
-- Y: perceived grey level (0.0 == black, 1.0 == white)
-- I, Q: color components
--
-- There are a great many versions of the constants used in these formulae.
-- The ones in this library uses constants from the FCC version of NTSC.

local function rgb_to_yiq(r, g, b)
    local y = 0.30*r + 0.59*g + 0.11*b
    local i = 0.74*(r-y) - 0.27*(b-y)
    local q = 0.48*(r-y) + 0.41*(b-y)
    return y, i, q
end

local function yiq_to_rgb(y, i, q)
    -- r = y + (0.27*q + 0.41*i) / (0.74*0.41 + 0.27*0.48)
    -- b = y + (0.74*q - 0.48*i) / (0.74*0.41 + 0.27*0.48)
    -- g = y - (0.30*(r-y) + 0.11*(b-y)) / 0.59

    local r = y + 0.9468822170900693*i + 0.6235565819861433*q
    local g = y - 0.27478764629897834*i - 0.6356910791873801*q
    local b = y - 1.1085450346420322*i + 1.7090069284064666*q

    if r < 0.0 then
        r = 0.0
    end
    if g < 0.0 then
        g = 0.0
    end
    if b < 0.0 then
        b = 0.0
    end
    if r > 1.0 then
        r = 1.0
    end
    if g > 1.0 then
        g = 1.0
    end
    if b > 1.0 then
        b = 1.0
    end
    return r, g, b
end


-- HLS: Hue, Luminance, Saturation
-- H: position in the spectrum
-- L: color lightness
-- S: color saturation

local function rgb_to_hls(r, g, b)
    local maxc = max(r, g, b)
    local minc = min(r, g, b)
    local sumc = (maxc+minc)
    local rangec = (maxc-minc)
    local l = sumc/2.0
    if minc == maxc then
        return 0.0, l, 0.0
    end
    local s
    if l <= 0.5 then
        s = rangec / sumc
    else
        s = rangec / (2.0-sumc)
    end
    local rc = (maxc-r) / rangec
    local gc = (maxc-g) / rangec
    local bc = (maxc-b) / rangec
    local h
    if r == maxc then
        h = bc-gc
    elseif g == maxc then
        h = 2.0+rc-bc
    else
        h = 4.0+gc-rc
    end
    h = (h/6.0) % 1.0
    return h, l, s
end


local function hls_to_rgb(h, l, s)
    if s == 0.0 then
        return l, l, l
    end
    local m2
    if l <= 0.5 then
        m2 = l * (1.0+s)
    else
        m2 = l+s-(l*s)
    end
    local m1 = 2.0*l - m2
    return _v(m1, m2, h+ONE_THIRD), _v(m1, m2, h), _v(m1, m2, h-ONE_THIRD)
end

local function _v(m1, m2, hue)
    hue = hue % 1.0
    if hue < ONE_SIXTH then
        return m1 + (m2-m1)*hue*6.0
    end
    if hue < 0.5 then
        return m2
    end
    if hue < TWO_THIRD then
        return m1 + (m2-m1)*(TWO_THIRD-hue)*6.0
    end
    return m1
end


-- HSV: Hue, Saturation, Value
-- H: position in the spectrum
-- S: color saturation ("purity")
-- V: color brightness

local function rgb_to_hsv(r, g, b)
    local maxc = max(r, g, b)
    local minc = min(r, g, b)
    local rangec = (maxc-minc)
    local v = maxc
    if minc == maxc then
        return 0.0, 0.0, v
    end
    local s = rangec / maxc
    local rc = (maxc-r) / rangec
    local gc = (maxc-g) / rangec
    local bc = (maxc-b) / rangec
    if r == maxc then
        h = bc-gc
    elseif g == maxc then
        h = 2.0+rc-bc
    else
        h = 4.0+gc-rc
    end
    h = (h/6.0) % 1.0
    return h, s, v
end

local function hsv_to_rgb(h, s, v)
    if s == 0.0 then
        return v, v, v
    end
    local i = int(h*6.0) -- XXX assume int() truncates!
    local f = (h*6.0) - i
    local p = v*(1.0 - s)
    local q = v*(1.0 - s*f)
    local t = v*(1.0 - s*(1.0-f))
    i = i%6
    if i == 0 then
        return v, t, p
    end
    if i == 1 then
        return q, v, p
    end
    if i == 2 then
        return p, v, t
    end
    if i == 3 then
        return p, q, v
    end
    if i == 4 then
        return t, p, v
    end
    if i == 5 then
        return v, p, q
    end
    -- Cannot get here
end


return {
    ONE_THIRD = ONE_THIRD,
    ONE_SIXTH = ONE_SIXTH,
    TWO_THIRD = TWO_THIRD,

    rgb_to_yiq = rgb_to_yiq,
    yiq_to_rgb = yiq_to_rgb,
    rgb_to_hls = rgb_to_hls,
    hls_to_rgb = hls_to_rgb,
    rgb_to_hsv = rgb_to_hsv,
    hsv_to_rgb = hsv_to_rgb
}
