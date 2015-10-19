local PATH = (...):match('^(.+)%.[^%.]+') .. '.'

local vec2 = require "hump.vector"
local camera = require "hump.camera"

local node ={}
node.__index = node
node.children = {}

local function isnode(n)
    return type(n) == "table" and type(n.children) == "table"
        and vec2.isvector(n.pos) and type(n.cam) == "table"
end

local function new(pt, zorder, parent)
    pt = pt or vec2()
    zorder = zorder or 0
    parent = parent or nil
    local t = {
        pos = pt,
        anchorPt = vec2(0.5, 0.5),
        zorder = zorder,
        parent = parent,
        cam = camera(pt.x, pt.y)
    }
    if parent then assert(isnode(parent)); parent:addChild(t) end
    return setmetatable(t, node)
end

function node:setPosition(x, y)
    if type(x) == "table" then
        self.pos = x
        assert(vec2.isvector(x))
    elseif type(x) == "number" and type(y) == "number" then
        self.pos = vec2(x, y)
    end
    self.cam:lookAt(self.pos.x, self.pos.y)
end

function node:move(x, y)
    self:setPosition(x, y)
    return self
end

function node:getPosition()
    return self.pos
end

function node:setAnchorPoint(pt)
    self.anchorPt = pt
end

function node:getAnchorPoint()
    return self.anchorPt
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
    for k, v in ipairs(self.children) do
        if v == n then
            return table.remove(self.children, k)
        end
    end
    return self
end

function node:removeAllChildren()
    self.children = {}
    return self
end

function node:draw()
    self:onDraw()
    for _, v in ipairs(self.children) do
        v:onDraw()
    end
end

function node:onDraw()
end

return setmetatable({new=new}, {__call=function(_, ...) return new(...) end})

