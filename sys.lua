return {
    argv = arg,
    modules = package.loaded,
    copyright = [[Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>
All Rights Reserved.
]],
    exit = function(arg)
        if arg == nil then
            os.exit(0)
        elseif type(arg) == "number" then
            os.exit(arg)
        else
            print{arg}
            os.exit(1)
        end
    end
}
