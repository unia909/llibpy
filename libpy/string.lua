local whitespace = " \t\n\r\v\f"
local ascii_lowercase = "abcdefghijklmnopqrstuvwxyz"
local ascii_uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
local ascii_letters = ascii_lowercase..ascii_uppercase
local digits = "0123456789"
local punctuation = [[!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~]]

return {
    whitespace = whitespace,
    ascii_lowercase = ascii_lowercase,
    ascii_uppercase = ascii_uppercase,
    ascii_letters = ascii_letters,
    digits = digits,
    hexdigits = digits.."abcdef".."ABCDEF",
    octdigits = "01234567",
    punctuation = punctuation,
    printable = digits..ascii_letters..punctuation..whitespace
}