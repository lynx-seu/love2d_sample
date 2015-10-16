local PATH = (...):match('^(.+)%.[^%.]+') .. '.'

local Node = require(PATH .. 'node')

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
    self:onDraw()
    love.graphics.pop()
end

function Scene:onDraw() end

return setmetatable({new=new}, {__call=function(_, ...) return new(...) end})
