local Scene = {}
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

local function transferPos(x, y)
    local scale_x, scale_y = _env.GetScale():unpack()
    return x*scale_x, y*scale_y
end

function Scene:draw()
    love.graphics.push()
    love.graphics.scale(_env.GetScale():unpack())
    self:onDraw()
    love.graphics.pop()
end

function Scene:onDraw() end

--function Scene:DrawLine(x1, y1, x2, y2)
    --x1, y1 = transferPos(x1, y1)
    --x2, y2 = transferPos(x2, y2)
    --love.graphics.line(x1, y1, x2, y2)
--end


return setmetatable({new=new}, {__call=function(_, ...) return new(...) end})
