local base = require "base.basescene"
local game = base()
local camera = require "hump.camera"

local lg = love.graphics

local cam
local t = 0
local angle = 0

function game:init()
    cam = camera(400, 640)
end

function game:update(dt)
    print(cam:rotate(math.pi/2 * dt))
end

--function game:draw()
    --self:onDraw()
--end

function game:onDraw()
    love.graphics.circle("line", 0, 0, 100, 8)
    cam:draw(function ()
        love.graphics.circle("line", 400, 640, 100, 8)
        lg.print("hello,world", 400, 640)
    end)
	love.graphics.setPointSize(5)
	love.graphics.setColor(0, 0, 0xff)
	love.graphics.point(400, 640)
end

return game
