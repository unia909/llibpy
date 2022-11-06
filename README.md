# llibpy
This repository contains Cpython standart library implementation for luajit. It makes lua more like Python by just adding one line in top of the file. This library expect, that source files in utf-8 encoding
## How it works?
Let's write a simple hello world program
```lua
require "libpy"
print{"Hello world!"}
```
## Why is it necessary use curly braces in print?
Because of optional arguments. If you will write `print("hello", "world")` in round brackets you cannot specify optional arguments like `sep` and `end`. If you want to use them, you need to use that syntax.
```lua
require "libpy"
print({"Hello", "world"}, nil, "!\nThis will be written on the new line!\n")
```
First argument there is a `objects` to write. Second is a `sep`. If argument is nil, it takes default value. And the last argument is a `end`
# Features
- full implemented modules: `errno`, `winreg`, `winsound`, `msvcrt`
- partially implemented modules: `base64`, `math`, `os`, `sys`, `platform`, `random`, `time`
- unicode console input/output on Windows
- modules, that does not depend on main libpy: `math`, `winsound`, `utf8`(lua library for utf8, partially rewritten in lua)
# Some other examples of the programs
- Command line arguments example. Here `local sys = require "sys"` is the same as `import sys` in Python. Take into consideration, that some modules as `os` and `math` requires `./` at the beggining of they names because they already exist in standart lua library.
```lua
require "libpy"
local sys = require "sys"

local total = 0
for i in range(2, len(sys.argv) + 1) do
    total = total + sys.argv[i]
endthe 
print{'sum =', total}
```
- "Guess the Number" Game (converted) from http://inventwithpython.com
```lua
require "libpy"
local random = require "random"

local guesses_made = 0
local guess = 0

local name = input('Hello! What is your name?\n')

local number = random.randint(1, 20)
print{'Well, '..name..', I am thinking of a number between 1 and 20.'}

while guesses_made < 6 do
    guess = int(input('Take a guess: '))

    guesses_made = guesses_made + 1

    if guess < number then
        print{'Your guess is too low.'}
    elseif guess > number then
        print{'Your guess is too high.'}
    elseif guess == number then
        break
    end
end


if guess == number then
    print{'Good job, '..name..'! You guessed my number in '..guesses_made..' guesses!'}
else
    print{'Nope. The number I was thinking of was '..number}
end
```
