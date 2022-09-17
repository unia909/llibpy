local io = require "io"

-- from https://stackoverflow.com/a/779960
-- converted to luajit code
function string:replace(rep, with)
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

-- table to string code from https://gist.github.com/justnom/9816256
-- some modified for python compatible
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
        elseif type(v) == "boolean" then
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
            result = result..table.toStringLua(v)
        elseif type(v) == "boolean" then
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

local _tostring = tostring
function tostring(obj)
    if type(obj) == "table" then
        return table.toString(obj)
    else
        return _tostring(obj)
    end
end

local str = tostring

function print(objects, sep, _end)
    sep = sep or " "
    _end = _end or "\n"
    io.write(str(objects))
    io.write(_end)
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