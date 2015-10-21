local PATH = (...):match('^(.+)%.[^%.]+') .. '.'

local Node = require(PATH .. 'node')
local Sprite = require(PATH .. 'sprite')
local Vec2 = require("hump.vector")

local Scene = Node()
Scene.__index = Scene

local function new()
    local t = {}
    return setmetatable(t, Scene)
end

function Scene:keypressed()
end

function Scene:keyreleased(key)
    if key == "escape" then 
        self:onClose()
        self:onExit()
        self = nil
    end
end

function Scene:worldPos()
    return Vec2(0, 0)
end

function Scene:onClose() end

function Scene:leave() 
    package.loaded[self.mod] = nil
    self:onExit()
end

function Scene:switch(mod)
    mod = _env.GetScenesRoot() .. mod
    _scenemgr.switch(mod)
    self = nil
    collectgarbage()
end

function Scene:draw()
    love.graphics.push()
    love.graphics.scale(_env.GetScale():unpack())
    for _, v in ipairs(self.children) do
        v:draw()
    end
    self:onDraw()
    love.graphics.pop()
end

function Scene:onDraw() end

function Scene:addSprite(name, pos, parent, zorder)
    assert(type(name) == "string" and Vec2.isvector(pos) )
    if parent == 0 or not parent then parent = self end
    zorder = zorder or 0
    --name = _env.GetResRoot() .. name 
    local sp = Sprite(name, zorder)
    sp:move(pos):addTo(parent)
    return sp
end



return setmetatable({new=new}, {__call=function(_, ...) return new(...) end})
