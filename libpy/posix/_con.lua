return {
    write = io.write,
    read = function()
        return io.read("*l")
    end
}