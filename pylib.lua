local io = require "io"

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