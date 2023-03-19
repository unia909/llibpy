local ffi = require "ffi"
require "libcdef"
local C = ffi.C
local utf8 = require "utf8"
local con = require "_con"
local libpyex = require "libpyex"
local ffit = require "ffitypes"
local charp = ffit.charp
local uchara = ffit.uchara
local ucharp = ffit.ucharp
local intt = ffit.int
local lstr = ffi.string

-- from https://stackoverflow.com/a/779960
-- converted to luajit code
function string:replace(rep, with)
    local len_rep = #rep
    local len_with = #with

    local orig_len = #self
    local orig_ptr = C.malloc(orig_len + 1)
    C.memcpy(orig_ptr, self, orig_len + 1)

    local orig = ffi.cast(charp, orig_ptr)

    local ins = orig
    local count = intt()
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

    local luastr = lstr(result, len_tmp)..lstr(orig)
    C.free(result)
    C.free(orig_ptr)
    return luastr
end

function string:lstrip(chars)
    if chars == nil then
        chars = " "
    elseif type(chars) ~= "string" then
        raise(TypeError("lstrip arg must be nil or string"))
    end
    
    return string.gsub(self, "^["..chars.."]+", "")
end

function string:rstrip(chars)
    if chars == nil then
        chars = " "
    elseif type(chars) ~= "string" then
        raise(TypeError("rstrip arg must be nil or string"))
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
        raise(TypeError("sep must be string or nil, not "..type(sep)))
    elseif sep == '' then
        raise(ValueError("empty separator"))
    end
    
    if maxlines ~= nil and type(maxlines) ~= "number" then
        raise(TypeError("number type expected, not "..type(maxlines)))
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
    start = start or 0
    local count = 0
    local tmp = ffi.cast(charp, self) + start
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
    for i, item in pairs(iterable) do
        if out ~= "" then
            out = out..self
        end
        out = out..item
    end
    return out
end

function string:format(table)
    local out = ""
    local prev_capture = 1
    for i = 1, #self do
        if self:at(i) == '{' then
            local capture_begin = i + 1
            local capture_end = i + 2
            for j = capture_end, #self do
                if self:at(j) == '}' then
                    capture_end = j
                    break
                end
            end
            if self:at(capture_end) ~= '}' then
                error(ValueError("Single '{' encountered in format string"))
            end
            local replacement_name = self:sub(capture_begin, capture_end - 1)
            -- convert to number if possible
            replacement_name = tonumber(replacement_name) or replacement_name
            local replacement = table[replacement_name]
            if replacement == nil then
                raise(IndexError("Replacement index "..replacement_name.." out of range for positional args tuple"))
            end
            out = out..self:sub(prev_capture, capture_begin - 2)..replacement
            prev_capture = capture_end + 1
        end
    end
    return out..self:sub(prev_capture)
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
        if type(v) == "string" then
            result = result.."'"..v.."'"
        else
            result = result..tostring(v)
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
        if type(v) == "string" then
            result = result.."'"..v.."'"
        else
            result = result..tostring(v)
        end
        result = result..", "
    end
    -- Remove leading commas from the result
    if result ~= "" then
        result = result:sub(1, result:len()-2)
    end
    return result.."}"
end

function len(obj)
    if type(obj) == "string" then
        return utf8.len(obj)
    elseif type(obj) == "table" then
        return #obj
    else
        raise(TypeError("object of type '"..type(obj).."' has no len()"))
    end
end

local function safe_bool_call(obj)
    return obj:__bool__()
end

function bool(obj)
    if type(obj) == "boolean" then
        return obj
    elseif type(obj) == "string" then
        return #obj ~= 0
    elseif type(obj) == "number" then
        return number ~= 0
    else
        local stat, ret = pcall(safe_bool_call, obj)
        if not stat then
            if type(obj) == "table" then
                return true
            else
                return false
            end
        else
            return ret
        end
    end
end

function string:at(idx)
    return string.sub(self, idx, idx)
end

function string:zfill(width)
    local l = len(self)
    if width <= l then return self end
    if self:at(1) == '-' then
        return '-'..string.rep('0', width - l)..self:sub(2)
    end
    return string.rep('0', width - l)..self
end

abs = math.abs

function aiter(async_iterable)
    return async_iterable.__aiter__()
end

function all(iterable)
    for i, element in pairs(iterable) do
        if not element then
            return false
        end
    end
    return true
end

function any(iterable)
    for i, element in pairs(iterable) do
        if element then
            return true
        end
    end
    return false
end

ffi.cdef [[
    typedef struct {
        unsigned char *source;
        long long size;
        const char *encoding;
    } bytes_t;
]]

local bytes_t = ffi.metatype("bytes_t", {
    __len = function(self) return self.size end,
    __tostring = function(self)
        local s = "b'"
        for i in range(self.size) do
            s = s..libpyex.getescorprntchar(self.source[i])
        end
        return s.."'"
    end,
    __index = {
        __bool__ = function(self)
            return self.source ~= nil
        end
    }
})

function bytes(source, size)
    if type(source) == "number" then
        size = source
        source = uchara(source)
    elseif size == nil then
        size = #source
    end
    if type(source) == "string" then
        source = ffi.cast(ucharp, source)
    end
    return bytes_t(source, size)
end
b = bytes
bytearray = bytes

function callable(object)
    return type(object) == "function" or (type(object) == "table" and type(getmetatable(object).__call) == "function")
end

chr = utf8.char
ord = utf8.codepoint

function hex(n)
    return string.format("0x%x", n)
end

local _tostring = tostring
function tostring(obj)
    if type(obj) == "table" then
        if type(obj.__str__) == "function" then
            return obj:__str__()
        end
        local mt = getmetatable(obj)
        if mt == nil or type(mt.__tostring) ~= "function" then
            return table.toStringLua(obj)
        end
    end
    return _tostring(obj)
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

iter = function(iterable)
    local f = pairs(iterable)
    local previ = 0
    return function()
        local i, item = f(iterable, previ)
        previ = i
        return item
    end
end

function sum(iterable, start)
    local _sum = start or 0
    for i, item in pairs(iterable) do
        _sum = _sum + item
    end
    return _sum
end

function print(objects)
    local _end = objects._end or "\n"
    if objects == nil then
        con.write(_end)
        return
    end
    local nobj = #objects
    if nobj == 0 then
        con.write(_end)
        return
    elseif nobj == 1 then
        con.write(str(objects[1]).._end)
        return
    end
    local sep = objects.sep or " "
    local out = str(objects[1])..sep
    for i = 2, nobj - 1 do
        out = out..str(objects[i])..sep
    end
    con.write(out..str(objects[nobj]).._end)
end

function range(start, stop, step)
    if not stop then
        local i = -1
        return function()
            i = i + 1
            if i >= start then
                return nil
            end
            return i
        end
    else
        step = step or 1
        local i = start - step
        return function()
            i = i + step
            if i >= stop then
                return nil
            end
            return i
        end
    end
end

function input(prompt)
    if type(prompt) == "string" then
        print{prompt, _end=""}
    end
    return con.read()
end

function open(file, mode)
    return io.open(file, mode or "r")
end

function zip(iterables, strict)
    local i = 0
    return function()
        i = i + 1
        return unpack(iterables[i])
    end
end

function index_bases(table, key)
    for i, e in ipairs(table.__bases__) do
        local val = e[key]
        if val ~= nil then return val end
    end
end

function class(name, bases, init, static, meta)
    local meta = meta or {}
    local static = static or {}
    if bases == nil then
        bases = {}
    end
    local init = init or function(selfptr, ...)
        if bases[1] ~= nil and callable(bases[1].__init__) then
            bases[1].__init__(selfptr, ...)
        end
    end
    static.__init__ = init
    static.__bases__ = bases
    static.__name__ = name
    static.__mro__ = {}

    meta.__index = index_bases
    if meta.__call == nil then
        meta.__call = function(self, ...)
            local table = setmetatable({}, {__index=self})
            init({table}, ...)
            return table
        end
    end
    return setmetatable(static, meta)
end

function isinstance(class, what_i_want)
    if type(what_i_want) == "table" and type(what_i_want.__name__) == "string" then
        what_i_want = what_i_want.__name__
    elseif type(what_i_want) ~= "string" then
        return false
    end
    if class.__name__ == what_i_want then
        return true
    end
    for i, e in ipairs(class.__bases__) do
        local is_it = isinstance(e, what_i_want)
        if is_it then return true end
    end
    return false
end

BaseException = class("BaseException", {}, function(selfptr, args)
    local self = selfptr[1]
    self.args = args
end, {
    __str__ = function(self)
        return str(self.args)
    end
})

SystemExit = class("SystemExit", {BaseException})
KeyboardInterrupt = class("KeyboardInterrupt", {BaseException})
GeneratorExit = class("GeneratorExit", {BaseException})
Exception = class("Exception", {BaseException})
    StopIteration = class("StopIteration", {Exception})
    StopAsyncIteration = class("StopAsyncIteration", {Exception})
    ArithmeticError = class("ArithmeticError", {Exception})
        FloatingPointError = class("FloatingPointError", {ArithmeticError})
        OverflowError = class("OverflowError", {ArithmeticError})
        ZeroDivisionError = class("ZeroDivisionError", {ArithmeticError})
    AssertionError = class("AssertionError", {Exception})
    AttributeError = class("AttributeError", {Exception})
    BufferError = class("BufferError", {Exception})
    EOFError = class("EOFError", {Exception})
    ImportError = class("ImportError", {Exception})
        ModuleNotFoundError = class("ModuleNotFoundError", {ImportError})
    LookupError = class("LookupError", {Exception})
        IndexError = class("IndexError", {LookupError})
        KeyError = class("KeyError", {LookupError})
    MemoryError = class("MemoryError", {Exception})
    NameError = class("NameError", {Exception})
        UnboundLocalError = class("UnboundLocalError", NameError)
    OSError = class("OSError", {Exception})
        BlockingIOError = class("BlockingIOError", {OSError})
        ChildProcessError = class("ChildProcessError", {OSError})
        ConnectionError = class("ConnectionError", {OSError})
            BrokenPipeError = class("BrokenPipeError", {ConnectionError})
            ConnectionAbortedError = class("ConnectionAbortedError", {ConnectionError})
            ConnectionRefusedError = class("ConnectionRefusedError", {ConnectionError})
            ConnectionResetError = class("ConnectionResetError", {ConnectionError})
        FileExistsError = class("FileExistsError", {OSError})
        FileNotFoundError = class("FileNotFoundError", {OSError})
        InterruptedError = class("InterruptedError", {OSError})
        IsADirectoryError = class("IsADirectoryError", {OSError})
        NotADirectoryError = class("NotADirectoryError", {OSError})
        PermissionError = class("PermissionError", {OSError})
        ProcessLookupError = class("ProcessLookupError", {OSError})
        TimeoutError = class("TimeoutError", {OSError})
    ReferenceError = class("ReferenceError", {Exception})
    RuntimeError = class("RuntimeError", {Exception})
        NotImplementedError = class("NotImplementedError", {RuntimeError})
        RecursionError = class("RecursionError", {RuntimeError})
    SyntaxError = class("SyntaxError", {Exception})
        IndentationError = class("IndentationError", {SyntaxError})
            TabError = class("TabError", {IndentationError})
    SystemError = class("SystemError", {Exception})
    TypeError = class("TypeError", {Exception})
    ValueError = class("ValueError", {Exception})
        UnicodeError = class("UnicodeError", {ValueError})
            UnicodeDecodeError = class("UnicodeDecodeError", {UnicodeError})
            UnicodeEncodeError = class("UnicodeEncodeError", {UnicodeError})
            UnicodeTranslateError = class("UnicodeTranslateError", {UnicodeError})
    Warning = class("Warning", {Exception})
        DeprecationWarning = class("DeprecationWarning", {Warning})
        PendingDeprecationWarning = class("PendingDeprecationWarning", {Warning})
        RuntimeWarning = class("RuntimeWarning", {Warning})
        SyntaxWarning = class("SyntaxWarning", {Warning})
        UserWarning = class("UserWarning", {Warning})
        FutureWarning = class("FutureWarning", {Warning})
        ImportWarning = class("ImportWarning", {Warning})
        UnicodeWarning = class("UnicodeWarning", {Warning})
        BytesWarning = class("BytesWarning", {Warning})
        EncodingWarning = class("EncodingWarning", {Warning})
        ResourceWarning = class("ResourceWarning", {Warning})

function raise(exc)
    if not isinstance(exc, BaseException) then
        raise(TypeError("exceptions must derive from BaseException"))
    end
    __raised_exception = exc
    local message = str(exc)
    if message == nil then
        error(exc.__name__, 2)
    else
        error(exc.__name__..": "..str(exc.args), 2)
    end
end
