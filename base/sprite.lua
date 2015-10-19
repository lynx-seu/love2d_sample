local PATH = (...):match('^(.+)%.[^%.]+') .. '.'
local Node = require(PATH .. 'node')

local LG = love.graphics 

local sprite = Node()
sprite.__index = sprite
sprite.img = nil 

local function new(source, zorder)
    local o = {}
    setmetatable(o, sprite)
    if type(source) ~= "string" then error "filename must be string" end
    if string.byte(source) == 35 then
        local str = string.sub(source, 2) 
    else
        o.img = LG.newImage(source)
    end
    zorder = zorder or 0
    o:setZorder(zorder)
    return o
end

function sprite:onDraw()
    if not self.img then error "Sprite's img == nil" end
    local anchor_pt = self:getAnchorPoint()  
    local pt = self:getPosition()
    local w, h = self.img:getWidth(), self.img:getHeight()
    local x = pt.x - w * anchor_pt.x
    local y = pt.y - h * anchor_pt.y
    LG.draw(self.img, x, y)
end

return setmetatable({new=new}, {__call=function(_, ...) return new(...) end})
