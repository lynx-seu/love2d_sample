local PATH = (...):match('^(.+)%.[^%.]+') .. '.'

local Vec2 = require "hump.vector"
local camera = require "hump.camera"

local node ={}
node.__index = node

local function isnode(n)
    return type(n) == "table" and Vec2.isvector(n.pos) 
            and type(n.cam) == "table"
end

local function new(pt, zorder, parent)
    pt = pt or Vec2()
    zorder = zorder or 0
    parent = parent or nil
    local t = {
        pos = pt,
        anchorPtInPoints = Vec2(0,0),
        anchorPt = Vec2(0, 0),
        size = Vec2(0, 0),
        zorder = zorder,
        parent = parent,
        cam = camera(pt.x, pt.y)
    }
    if parent then assert(isnode(parent)); parent:addChild(t) end
    return setmetatable(t, node)
end

function node:onEnter()
    for _, v in ipairs(self.children) do
        v:onEnter()
    end
end

function node:onExit()
    self:removeAllChildren()
    collectgarbage()
end

function node:worldPos()
    assert(self.parent)
    local v = self.parent:worldPos()
    local x = v.x + self.pos.x - self.anchorPtInPoints.x
    local y = v.y + self.pos.y - self.anchorPtInPoints.y
    return Vec2(x, y)
end

function node:setPosition(x, y)
    if type(x) == "table" then
        self.pos = x
        assert(Vec2.isvector(x))
    elseif type(x) == "number" and type(y) == "number" then
        self.pos = Vec2(x, y)
    end
    self.cam:lookAt(self.pos.x, self.pos.y)
end

function node:move(x, y)
    self:setPosition(x, y)
    return self
end

function node:rotate(angle)
    self.cam:rotate(angle)
end

function node:getPosition()
    return self.pos
end

function node:setAnchorPoint(pt)
    if self.anchorPt ~= pt then
        self.anchorPt = pt
        self.anchorPtInPoints = Vec2(self.size.x * pt.x, self.size.y * pt.y)
    end
end

function node:getAnchorPoint()
    return self.anchorPt
end

function node:setSize(w, h)
    self.size.x, self.size.y = w, h 
end

function node:getSize()
    return self.size
end

function node:setZorder(zorder)
    zorder = zorder or 0
    self.zorder = zorder
    if self.parent then
        self.parent:sortChildren()
    end
end

function node:addTo(parent)
    if not isnode(parent) then error "parent must be a node" end
    if self.parent then error "parent ~= nil" end
    parent:addChild(self)
    return self
end

function node:addChild(n)
    if not isnode(n) then error "n must be a node" end
    n.parent = self
    self.children = self.children or {}
    table.insert(self.children, n)
    self:sortChildren()
    return self
end

function node:sortChildren()
    table.sort(self.children, function (a, b)
        return a.zorder < b.zorder
    end)
end

function node:removeChild(n)
    self.children = self.children or {}
    for k, v in ipairs(self.children) do
        if v == n then
            n:onExit()
            return table.remove(self.children, k)
        end
    end
    return self
end

function node:removeAllChildren()
    self.children = self.children or {}
    for _, v in ipairs(self.children) do
        v:onExit()
    end
    self.children = {}
    return self
end

function node:draw()
    self.cam:attach()
        self:onDraw()
        if self.children then 
            for _, v in ipairs(self.children) do
                v:onDraw()
            end
        end
    self.cam:detach()
end

function node:onDraw()
end

return setmetatable({new=new}, {__call=function(_, ...) return new(...) end})

