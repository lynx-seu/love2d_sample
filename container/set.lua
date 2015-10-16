local set = {}

function set:new(o)
    local tmp = {}
    setmetatable(tmp, self)
    self.__index = self
    if o then
        for _, l in pairs(o) do tmp[l] = true end
    end
    return tmp 
end

function set:size()
    local size = 0
    for k in pairs(self) do
        size = size + 1
    end
    return size
end

function set:insert(ele)
    self[ele] = true
end

function set:remove(ele)
    if self[ele] then self[ele] = nil end
end

function set:shift()
    local ele
    for k in pairs(self) do
        ele = k
        self:remove(k)
        break
    end
    return ele
end

--  并集
function set:__add(b)
    if getmetatable(self) ~= set or getmetatable(b) ~= set then
        error("attempt to `add' a set with non-set value", 2)
    end
    local res = set:new{}
    for k in pairs(self) do res[k] = true end
    for k in pairs(b) do res[k] = true end
    return res
end

-- 差集
function set:__sub(b)
    if getmetatable(self) ~= set or getmetatable(b) ~= set then
        error("attempt to `sub' a set with non-set value", 2)
    end
    local res = set:new{}
    for k in pairs(self) do
        if not b[k] then res[k] = true end
    end
    return res
end

-- 包含关系
function set:__le(b)
    if getmetatable(self) ~= set or getmetatable(b) ~= set then
        error("attempt to `le' a set with non-set value", 2)
    end
    for k in pairs(self) do
        if not b[k] then return false end
    end
    return true
end

function set:__lt(b)
    return self <= b and not (b <= self)
end

function set:__eq(b)
    return self <= b and b <= self
end

function set:__tostring()
    local s = "{"
    local sep = ""
    for e in pairs(self) do
        s = s .. sep .. e
        sep = ", "
    end
    return s .. "}"
end


------------ test ------------ 
--s1 = set:new{1, 2, 3}
--print(s1)
--print(s1:size())


return set
