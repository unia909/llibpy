local io = require "io"

-- from https://stackoverflow.com/a/779960
-- converted to luajit code
function string:replace(rep, with)
    require "libcdef"
    local ffi = require "ffi"

    local len_rep = #rep
    local len_with = #with
    local len_front = 0

    local orig_len = #self
    local orig_ptr = ffi.C.malloc(orig_len + 1)
    ffi.copy(orig_ptr, self)

    local orig = ffi.cast('const char*', orig_ptr)

    local ins = orig
    local count = ffi.new('int')
    local tmp = 0
    while true do
        tmp = ffi.C.strstr(ins, rep)
        if tmp == nil then
            break
        end
        ins = tmp + len_rep
        count = count + 1
    end

    tmp = ffi.C.malloc(orig_len + (len_with - len_rep) * count + 1)
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
        ins = ffi.C.strstr(orig, rep)
        len_front = ins - orig
        tmp = ffi.C.strncpy(tmp, orig, len_front) + len_front
        tmp = ffi.C.strcpy(tmp, with) + len_with
        orig = orig + len_front + len_rep -- move to next "end of rep"
        count = count - 1
    end

    local luastr = ffi.string(result) .. ffi.string(orig)
    ffi.C.free(result)
    ffi.C.free(orig_ptr)
    return luastr
end

-- code based on https://gist.github.com/justnom/9816256
function table:toString()
    local result = "["
    for k, v in pairs(self) do
        -- Check the key type (ignore any numerical keys - assume its an array)
        if type(k) == "string" then
            result = result.."['"..k.."']".."="
        end

        result = result..str(v)..", "
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

        result = result..str(v)..", "
    end
    -- Remove leading commas from the result
    if result ~= "" then
        result = result:sub(1, result:len()-2)
    end
    return result.."}"
end

local _tostring = tostring
function tostring(obj)
    if type(obj) == "table" then
        return table.toString(obj)
    else
        return _tostring(obj)
    end
end

str = tostring
int = tonumber
chr = string.char
pow = math.pow

function eval(expression)
    return loadstring("return "..expression)()
end

float = eval

function exec(expression)
    loadstring(expression)()
end

function callable(object)
    return type(object) == "function"
end

function sum(iterable, start)
    local _sum = start or 0
    for i in iterable do
        _sum = _sum + i
    end
    return _sum
end

function print(objects, sep, _end)
    local os = require "./os"
    _end = _end or "\n"
    if objects == nil then
        os.write(_end)
        return
    end
    sep = sep or " "
    os.write(str(objects).._end)
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
        io.write(prompt)
    end
    return io.read()
end

function open(file, mode)
    mode = mode or "r"
    return io.open(file, mode)
end