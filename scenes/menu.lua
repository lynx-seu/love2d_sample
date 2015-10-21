local Base = require "base.basescene"
local menu = Base()
local FrameMgr = require "base.framemgr"

local LG = love.graphics
local font

function menu:enter()
    self:addSprite('bg.jpg', {x=400, y=640})
    font = LG.newFont(_env.GetResRoot() .. 'corbel.ttf', 35)

    FrameMgr:load()
    print(FrameMgr.count)
    for k, v in pairs(FrameMgr.frames) do
        print(k, v)
    end
    print("drawq", LG.drawq)
end

function menu:onDraw()
    love.graphics.setColor(0, 0, 255, 255)
    local old_font = LG.getFont()
    LG.setFont(font)
    love.graphics.print("Press Enter to continue 123", 20, 20)
    LG.setFont(old_font)
    love.graphics.setColor(255, 255, 255, 255)

    love.graphics.setColor(255, 0, 0, 255)
    LG.line(0, 0, 800, 1280)
    love.graphics.setColor(255, 255, 255, 255)
end

function menu:update(dt)
end

function menu:onClose()
    self:switch("game")
end

function menu:keyreleased(key, code)
    if key == 'return' then
        self:switch('game')
    end
end

return menu
