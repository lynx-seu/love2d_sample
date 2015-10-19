local base = require "base.basescene"
local game = base()
local camera = require "hump.camera"
local Vec2 = require "hump.vector"

local lg = love.graphics

local cam
local t = 0
local angle = 0
local sp

function game:init()
    cam = camera(500, 640, 2)
    self:addSprite("avtar", Vec2(400, 640))
    self:addSprite("avtar", Vec2(500, 700), 0, 1)
end

function game:update(dt)
    print(dt)
    cam:rotate(math.pi/2 * dt)
end

--function game:draw()
    --self:onDraw()
--end

function game:onDraw()
    love.graphics.circle("line", 0, 0, 100, 8)
    cam:draw(function ()
        love.graphics.circle("line", 500, 640, 100, 8)
        lg.print("hello,world", 500, 640)
    end)
	love.graphics.setPointSize(5)
	love.graphics.setColor(0, 0, 0xff)
	love.graphics.point(500, 640)

	love.graphics.setColor(0xff, 0xff, 0xff)
end

return game
