function string:rfindchr(chr, last)
    local last = last or #self
    while last > 0 do
        local cur_chr = self:sub(last, last)
        if cur_chr == chr then
            return last
        end
        last = last - 1
    end
    return nil
end

local path = package.searchpath('libpy.__init__', package.path)
local idx = path:rfindchr('/') or path:rfindchr('\\')

package.path = package.path..(path:sub(1, idx).."?.lua;")
return require "libpy.libpy"