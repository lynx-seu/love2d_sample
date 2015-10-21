local base = require "base.basescene"
local game = base()
local camera = require "hump.camera"
local Vec2 = require "hump.vector"

local lg = love.graphics

local cam
local t = 0
local angle = 0
local sp = nil

function game:enter()
    cam = camera(500, 640, 2)
    sp = self:addSprite("avtar.png", Vec2(400, 640))
    --self:addSprite("avtar.png", Vec2(500, 640), 0, 1)
    self:addSprite("#player", Vec2(100, 30), sp, 1)
end

function game:update(dt)
    --print(dt)
    t = t + dt
    if t <= 10 then
        cam:rotate(math.pi/2 * dt)
        sp:rotate(math.pi/2 * dt)
    else
        self:removeChild(sp)
    end

end

function game:onDraw()
    cam:draw(function ()
        love.graphics.circle("line", 500, 640, 100, 8)
        lg.print("hello,world", 500, 640)
    end)
	love.graphics.setPointSize(5)
	love.graphics.setColor(0, 0, 0xff)
	love.graphics.point(500, 640)

	love.graphics.setColor(0xff, 0xff, 0xff)
end

function game:onClose()
    self:switch("menu")
end

return game
