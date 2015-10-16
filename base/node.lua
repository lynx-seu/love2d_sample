local vec2 = require "hump.vector"
local camera = require "hump.camera"

local node ={}
node.__index = node
node.children = {}

local function isnode(n)
    return type(n) == "table" and type(n.children) == "table"
        and type(n.pos) == "number" and type(n.cam) == "table"
end

local function new(pt)
    pt = pt or vec2()
    local t = {
        pos = pt,
        anchorPt = vec2(0.5, 0.5),
        cam = camera(pt.x, pt.y)
    }
    return setmetatable(t, node)
end

function node:setPosition(pos)
    self.pos = pos
    assert(vec2.isvector(pos))
    cam:lookAt(self.pos.x, self.pos.y)
end

function node:getPosition()
    return self.pos
end

function node:setAnchorPoint(pt)
    self.anchorPt = pt
end

function node:addChild(n)
    if not isnode(n) then error "n must be a node" end
end

function node:draw()
end

return setmetatable({new=new}, {__call=function(_, ...) return new(...) end})

