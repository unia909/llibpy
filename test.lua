local os = require "./os"
for dir in os.scandir("./") do
    print(dir)
end