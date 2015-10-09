local base = require "base.basescene"
local game = base()

function game:update(dt)
end

function game:draw()
    love.graphics.print("Game Start", 10, 10)
    self:DrawLine(0, 0, 400, 640)
    love.graphics.circle("fill", 400, 640, 50, 6)
    love.graphics.circle("fill", 240, 400, 50, 6)
end

return game
