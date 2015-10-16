local deque = {
    first = 0, last = -1
}

function deque:new(o)
    o = o or {}
    setmetatable(o, {__index=self})
    return o
end

function deque:empty()
    return self.first > self.last
end

function deque:size()
    return self.last - self.first + 1
end

function deque:unshift(value)
    self.first = self.first - 1
    self[self.first] = value
end

function deque:push(value)
    self.last = self.last + 1
    self[self.last] = value
end

function deque:shift()
    if self:empty() then error "deque is empty" end
    local value = self[self.first]
    self[self.first] = nil
    self.first = self.first + 1
    return value
end

function deque:pop()
    if self:empty() then error "deque is empty" end
    local value = self[self.last]
    self[self.last] = nil
    self.last = self.last - 1
    return value
end

function deque:iter()
    local i = 0
    return function ()
        i = i + 1 
        if i <= self:size() then
            return i, self[self.first+i-1]    
        end
    end
end

return deque
