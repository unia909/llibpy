return {
    getescorprntchar = function(byte)
        if byte == 9 then
            return "\\t"
        elseif byte == 10 then
            return "\\n"
        elseif byte == 13 then
            return "\\r"
        elseif byte == 39 then
            return "\\'"
        elseif byte == 92 then
            return "\\\\"
        elseif byte > 31 and byte < 127 then
            return string.char(byte)
        end
        return string.format("\\x%02x", byte)
    end
}
