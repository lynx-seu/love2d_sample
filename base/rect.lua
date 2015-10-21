local assert = assert

local rect = {}
rect.__index = rect

local function new(x, y, w, h)
    return  setmetatable({
        x = x or 0,
        y = y or 0,
        w = w or 0,
        h = h or 0,
    }, rect)
end

local zero = new()

local function isrect(v)
    return type(v) == "table" and type(v.x) == 'number' and type(v.y) == 'number'
            and type(v.w) == 'number' and type(v.h) == 'number'
end

function rect:clone()
    return new(self.x, self.y, self.w, self.h)
end

function rect:unpack()
    return self.x, self.y, self.w, self.h
end

function rect:__tostring()
    return "("..tonumber(self.x)..","..tonumber(self.y)..","..tonumber(self.w)..","..tonumber(self.h)..")"
end

function rect.__eq(a, b)
    return a.x == b.x and a.y == b.y and
           a.w == b.w and a.h == b.h
end

function rect:containsPoint(vec2)
    assert(type(vec2) == "table" and type(vec2.x) == "number" and type(vec2.y) == "number")
    return vec2.x >= self.x and vec2.y >= self.y 
        and vec2.x <= self.x + self.w and vec2.y <= self.y + self.h
end

return setmetatable({
    new = new,
    isrect = isrect,
    zero = zero,
}, {__call = function(_, ...) return new(...) end})
