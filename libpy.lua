local ffi = require "ffi"
require "libcdef"
local C = ffi.C
local utf8 = require "utf8"
local con = require "_con"
local libpyex = require "libpyex"

-- from https://stackoverflow.com/a/779960
-- converted to luajit code
function string:replace(rep, with)
    local len_rep = #rep
    local len_with = #with

    local orig_len = #self
    local orig_ptr = C.malloc(orig_len + 1)
    C.memcpy(orig_ptr, self, orig_len + 1)

    local orig = ffi.cast("char*", orig_ptr)

    local ins = orig
    local count = ffi.new("int")
    while true do
        local tmp = C.strstr(ins, rep)
        if tmp == nil then
            break
        end
        ins = tmp + len_rep
        count = count + 1
    end

    local len_tmp = orig_len + (len_with - len_rep) * count
    local tmp = C.malloc(len_tmp)
    local result = tmp

    -- first time through the loop, all the variable are set correctly
    -- from here on,
    --    tmp points to the end of the result string
    --    ins points to the next occurrence of rep in orig
    --    orig points to the remainder of orig after "end of rep"
    while true do
        if count == 0 then
            break
        end
        count = count - 1
        local len_front = C.strstr(orig, rep) - orig
        tmp = C.memcpy(tmp, orig, len_front) + len_front
        tmp = C.memcpy(tmp, with, len_with) + len_with
        orig = orig + len_front + len_rep -- move to next "end of rep"
    end

    local luastr = ffi.string(result, len_tmp)..ffi.string(orig)
    C.free(result)
    C.free(orig_ptr)
    return luastr
end

function string:lstrip(chars)
    if chars == nil then
        chars = " "
    elseif type(chars) ~= "string" then
        error("TypeError: lstrip arg must be nil or string")
    end
    
    return string.gsub(self, "^["..chars.."]+", "")
end

function string:rstrip(chars)
    if chars == nil then
        chars = " "
    elseif type(chars) ~= "string" then
        error("TypeError: rstrip arg must be nil or string")
    end
    
    return string.gsub(self, "["..chars.."]+$", "")
end

function string:strip(chars)
    return string.rstrip(string.lstrip(self, chars), chars)
end

function string:split(sep, maxlines)
    if sep == nil then
        sep = " "
    elseif type(sep) ~= "string" then
        error("TypeError: sep must be string or nil, not "..type(sep))
    elseif sep == '' then
        error("ValueError: empty separator")
    end
    
    if maxlines ~= nil and type(maxlines) ~= "number" then
        error("TypeError: number type expected, not "..type(maxlines))
    end
    
    local out = {}
    local curfind, lastfind = 0, 0
    
    local f = function()
        curfind = string.find(self, sep, lastfind + 1, true)
        if curfind == nil then
            table.insert(out, string.sub(self, lastfind + 1))
            return 1
        end
        table.insert(out, string.sub(self, lastfind, curfind - 1))
        lastfind = curfind
    end
    
    if maxlines == nil then
        while f() == nil do end
    else
        for i = 1, maxlines do
            if f() ~= nil then
                break
            end
        end
    end
    
    return out
end

-- code from https://stackoverflow.com/a/9052540
function string:count(sub, start, _end)
    if start == nil then
        start = 0
    end
    local count = 0
    local tmp = ffi.cast("char*", self) + start
    if _end ~= nil then
        tmp[_end] = 0
    end
    while true do
        tmp = C.strstr(tmp, sub)
        if tmp == nil then break end
        count = count + 1
        tmp = tmp + 1
    end
    return count
end

function string:join(iterable)
    local out = ""
    for i in iter(iterable) do
        if out ~= "" then
            out = out..self
        end
        out = out..i
    end
    return out
end

-- code based on https://gist.github.com/justnom/9816256
function table:toString()
    local result = "["
    for k, v in pairs(self) do
        -- Check the key type (ignore any numerical keys - assume its an array)
        if type(k) == "string" then
            result = result.."['"..k.."']".."="
        end

        -- Check the value type
        if type(v) == "table" then
            result = result..table.toString(v)
        elseif type(v) == "boolean" or type(v) == "function" then
            result = result..tostring(v)
        else
            result = result.."'"..v.."'"
        end
        result = result..", "
    end
    -- Remove leading commas from the result
    if result ~= "" then
        result = result:sub(1, result:len()-2)
    end
    return result.."]"
end

function table:toStringLua()
    local result = "{"
    for k, v in pairs(self) do
        -- Check the key type (ignore any numerical keys - assume its an array)
        if type(k) == "string" then
            result = result.."['"..k.."']".."="
        end

        -- Check the value type
        if type(v) == "table" then
            result = result..table.toString(v)
        elseif type(v) == "boolean" or type(v) == "function" then
            result = result..tostring(v)
        else
            result = result.."'"..v.."'"
        end
        result = result..", "
    end
    -- Remove leading commas from the result
    if result ~= "" then
        result = result:sub(1, result:len()-2)
    end
    return result.."}"
end

len = utf8.len

function string:zfill(width)
    local l = len(self)
    if l <= width then return self end
    
end

abs = math.abs

function aiter(async_iterable)
    return async_iterable.__aiter__()
end

function all(iterable)
    for element in iterable do
        if not element then
            return false
        end
    end
    return true
end

function any(iterable)
    for element in iterable do
        if element then
            return true
        end
    end
    return false
end

bytes = setmetatable({
    __pyclass__ = true,
    __str__ = function(self)
        local s = "b'"
        for i in range(self.size) do
            s = s..libpyex.getescorprntchar(self.source[i])
        end
        return s.."'"
    end,
    __sizeof__ = function(self) return self.size end
}, {
    __call = function(self, source, size)
        if type(source) == "number" then
            size = source
            source = ffi.new("unsigned char[?]", source)
        elseif size == nil then
            size = #source
        end
        if type(source) == "string" then
            source = ffi.cast("unsigned char*", source)
        end
        return setmetatable({source=source, size=size}, {__index=bytes})
    end
})
b = bytes

bytearray = setmetatable({
    __pyclass__ = true,
    __str__ = function(self)
        local s = "b'"
        for i in range(self.size) do
            s = s..libpyex.getescorprntchar(self.source[i])
        end
        return s.."'"
    end,
    __sizeof__ = function(self) return self.size end
}, {
    __call = function(self, source, size)
        if type(source) == "number" then
            size = source
            source = ffi.new("unsigned char[?]", source)
        elseif size == nil then
            size = #source
        end
        if type(source) == "string" then
            source = ffi.cast("unsigned char*", source)
        end
        return setmetatable({source=source, size=size}, {__index=bytes})
    end
})

function callable(object)
    return type(object) == "function"
end

chr = string.char

local _tostring = tostring
function tostring(obj)
    if type(obj) == "table" then
        if obj.__pyclass__ then
            return obj:__str__()
        end
        return table.toString(obj)
    else
        return _tostring(obj)
    end
end

str = tostring
int = tonumber
pow = math.pow

function eval(expression)
    return loadstring("return "..expression)()
end

float = eval

function exec(expression)
    loadstring(expression)()
end

function iter(val)
    if type(val) == "table" then
        return pairs(val)
    elseif val.__iter__ ~= nil then
        return val.__iter__()
    else
        error("'"..type(val).."' object is not iterable")
    end
end

function sum(iterable, start)
    local _sum = start or 0
    for i in iterable do
        _sum = _sum + i
    end
    return _sum
end

function print(objects, sep, _end)
    _end = _end or "\n"
    if objects == nil then
        con.write(_end)
        return
    end
    sep = sep or " "
    con.write(str(objects).._end)
end

function range(start, stop, step)
    if not stop then
        local i = -1
        return function()
            i = i + 1
            if i == start then
                return nil
            end
            return i
        end
    else
        step = step or 1
        local i = start - step
        return function()
            i = i + step
            if i == stop then
                return nil
            end
            return i
        end
    end
end

function input(prompt)
    if type(prompt) == "string" then
        print(prompt, nil, "")
    end
    return con.read()
end

function open(file, mode)
    mode = mode or "r"
    return io.open(file, mode)
end
