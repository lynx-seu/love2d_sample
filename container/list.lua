-- ½Úµã
local list_node = {}

function list_node:new(value, prev, next)
    local o = {}
    o.data = value
    o.prev = prev
    o.next = next
    setmetatable(o, {__index=self})
    return o
end

-- Á´±í
local list = {
    first=0, last=-1
}

function list:new(o)
    o = o or {}
    setmetatable(o, {__index=self})
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
    local prevNode = self[self.last-1]
    local node = list_node:new(value)
    if prevNode then
        prevNode.next = node
        node.prev = prevNode
    else
        node.prev = node
    end
    self[self.last] = node
end

function list:unshift(value)
    self.first = self.first - 1
    local nextNode = self[self.first + 1]
    local node = list_node:new(value); node.prev = node
    if nextNode then
        node.next = nextNode
    end
    self[self.first] = node
end

function list:shift()
    if self:empty() then error "deque is empty" end
    local value = self[self.first].data
    local headNode = self[self.first+1]
    if headNode then
        headNode.prev = headNode
    end
    self[self.first] = nil
    self.first = self.first + 1
    return value 
end

function list:pop()
    if self:empty() then error "deque is empty" end
    local value = self[self.last].data
    local tearNode = self[self.last-1]
    if tearNode then
        tearNode.next = nil
    end
    self[self.last] = nil
    self.last = self.last - 1
    return value
end

function list:iter()
    local cur = self:head()
    return function()
        if cur then
            local value = cur.data
            cur = cur.next
            return value
        end
    end
end

return list
