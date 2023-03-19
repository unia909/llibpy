local sakamoto = {0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4}

local floor = math.floor
local function idiv(n, d)
    return floor(n / d)
end

local function leap_years_since(year)
    return idiv(year, 4) - idiv(year, 100) + idiv(year, 400)
end

return {
    isleap = function(year)
        return year % 4 == 0 and (year % 100 ~= 0 or year % 400 == 0)
    end,
    leapdays = function(y1, y2)
        y1 = y1 - 1
        y2 = y2 - 1
        return (idiv(y2, 4) - idiv(y1, 4)) - (idiv(y2, 100) - idiv(y1, 100)) + (idiv(y2, 400) - idiv(y1, 400))
    end,
    weekday = function(day, month, year)
        if month < 3 then
            year = year - 1
        end
        return (year + leap_years_since(year) + sakamoto[month] + day - 1) % 7
    end,

    MONDAY = 0,
    TUESDAY = 1,
    WEDNESDAY = 2,
    THURSDAY = 3,
    FRIDAY = 4,
    SATURDAY = 5,
    SUNDAY = 6
}