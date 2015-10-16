-- Á´±í
local list = {
    first=0, last=-1
}
list.__index = list

local function new(o)
    o = o or {}
    if type(o) ~= "table" then error "must be a table or nil value" end
    setmetatable(o, list)
    for _, v in ipairs(o) do
        o:push(v)
    end
    return o
end

function list:empty()
    return self.first > self.last
end

function list:size()
    return self.last - self.first + 1
end

function list:head()
    if self:empty() then return nil end
    return self[self.first]
end

function list:tail()
    if self:empty() then return nil end
    return self[self.last]
end

function list:push(value)
    self.last = self.last + 1
    self[self.last] = value
end

function list:unshift(value)
    self.first = self.first - 1
    self[self.first] = value
end

function list:shift()
    if self:empty() then error "deque is empty" end
    local value = self[self.first]
    self[self.first] = nil
    self.first = self.first + 1
    return value 
end

function list:pop()
    if self:empty() then error "deque is empty" end
    local value = self[self.last]
    self[self.last] = nil
    self.last = self.last - 1
    return value
end

function list:iter()
    local i = 0
    return function()
        i = i + 1
        if i <= self:size() then
            return i, self[self.first+i-1]
        end
    end
end

return setmetatable({new=new}, {__call=function(_,...) return new(...) end})
