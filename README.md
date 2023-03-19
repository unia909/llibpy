# libpy
This repository contains Cpython standart library implementation for luajit. It makes lua more like Python by just adding one line in top of the file. This library expect, that source files in utf-8 encoding
## How can i use it?
Let's write a simple hello world program
```lua
require "libpy"
print("Hello world!")
```
# Features
- full implemented modules: `atexit`, `colorsys`, `errno`, `math`, `msvcrt`, `winreg`, `winsound`
- partially implemented modules: `base64`, `calendar`, `gc`, `os`, `platform`, `random`, `string`, `sys`, `time`
- unicode console input/output on Windows NT systems (Microsoft Windows/Wine/ReactOS/Windows 98+KernelEx)
- modules, that does not depend on the main library: `atexit`, `colorsys`, `errno`, `gc`, `math`, `winsound`, `utf8`(lua library for utf8, partially rewritten in lua)
# Some other examples of the programs
- Command line arguments example. Here `local sys = require "sys"` is the same as `import sys` in Python. Take into consideration, that some modules as `os` and `math` requires `./` at the beggining of they names because they already exist in standart lua library.
```lua
require "libpy"
local sys = require "sys"

local total = 0
-- lua tables index starts with 1
for i in range(2, len(sys.argv) + 1) do
    total = total + sys.argv[i]
end
print('sum =', total)
```
- "Guess the Number" Game (converted) from http://inventwithpython.com
```lua
require "libpy"
local random = require "random"

local guesses_made = 0
local guess = 0

local name = input('Hello! What is your name?\n')

local number = random.randint(1, 20)
print('Well, '..name..', I am thinking of a number between 1 and 20.')

while guesses_made < 6 do
    guess = int(input('Take a guess: '))

    guesses_made = guesses_made + 1

    if guess < number then
        print('Your guess is too low.')
    elseif guess > number then
        print('Your guess is too high.')
    elseif guess == number then
        break
    end
end

if guess == number then
    print('Good job, '..name..'! You guessed my number in '..guesses_made..' guesses!')
else
    print('Nope. The number I was thinking of was '..number)
end
```
