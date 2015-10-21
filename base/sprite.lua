local PATH = (...):match('^(.+)%.[^%.]+') .. '.'
local Node = require(PATH .. 'node')
local FrameMgr = require(PATH .. 'framemgr')

local LG = love.graphics 
local Vec2 = cc.vec2

local sprite = {}
sprite.__index = sprite
sprite.img = nil 

local function new(source, zorder)
    local node = Node()
    --setmetatable(o, sprite)
    local o = implement(node, sprite)
    o.quad = nil
    for k, v in pairs(o) do
        print(k, "-->", v)
    end
    if type(source) ~= "string" then error "filename must be string" end
    if string.byte(source) == 35 then
        local str = string.sub(source, 2) 
        local rect
        o.img, rect = FrameMgr:getFrame(str)
        o:setSize(rect.w, rect.h)
        local x, y, w, h = rect:unpack()
        o.quad = LG.newQuad(x, y, w, h, o.img:getDimensions())
    else
        o.img = LG.newImage(_env.GetResRoot() .. source)
        local w, h = o.img:getWidth(), o.img:getHeight()
        o:setSize(w, h)
    end
    zorder = zorder or 0
    o:setZorder(zorder)
    o:setAnchorPoint(Vec2(0.5, 0.5))
    return o
end

function sprite:onDraw()
    if not self.img then error "Sprite's img == nil" end
    --local x = self.pos.x - self.anchorPtInPoints.x 
    --local y = self.pos.y - self.anchorPtInPoints.y
    local v = self:worldPos()
    if not self.quad then
        LG.draw(self.img, v:unpack())
    else
        LG.draw(self.img, self.quad, v:unpack())
    end
end

function sprite:onExit()
    if not self.quad then self.img = nil end
end

return setmetatable({new=new}, {__call=function(_, ...) return new(...) end})
