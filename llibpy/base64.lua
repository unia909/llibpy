require "libpy"
local ffi = require "ffi"
local b64 = require "mime_base64"

local b64enc = function(s)
    local b, s = b64.base64_encode(s.source, s.size)
    return bytes(b, s)
end

local b64dec = function(s)
    local b, s = b64.base64_decode(s.source, s.size)
    return bytes(b, s)
end

return {
    b64encode = b64enc,
    b64decode = b64dec,
    standart_b64encode = b64enc,
    standart_b64decode = b64dec,

    -- legacy interface
    decodebytes = b64dec,
    encodebytes = b64enc
}
