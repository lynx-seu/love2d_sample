local PATH = (...):match('^(.+)%.[^%.]+') .. '.'

local Node = require(PATH .. 'node')
local Sprite = require(PATH .. 'sprite')
local Vec2 = require("hump.vector")

local Scene = Node()
Scene.__index = function(self, key)
    return Scene[key] or (function () 
        local function __null__() end
        rawset(self, key, __null__)
        return __null__
    end)()
end

local function new()
    local t = {}
    return setmetatable(t, Scene)
end


function Scene:draw()
    love.graphics.push()
    love.graphics.scale(_env.GetScale():unpack())
    for _, v in ipairs(self.children) do
        v:onDraw()
    end
    self:onDraw()
    love.graphics.pop()
end

function Scene:onDraw() end

function Scene:addSprite(name, pos, parent, zorder)
    assert(type(name) == "string" and Vec2.isvector(pos) )
    if parent == 0 or not parent then parent = self end
    zorder = zorder or 0
    name = _env.GetResRoot() .. name .. ".png"
    local sp = Sprite(name, zorder)
    sp:move(pos):addTo(parent)
    return sp
end

return setmetatable({new=new}, {__call=function(_, ...) return new(...) end})
