local menu = {}

local test

function menu:init()
    test = love.graphics.newImage(res_root .. "/bg.jpg")
end

function menu:leave()
end

function menu:draw()
    love.graphics.print("Press Enter to continue", 10, 10)
    love.graphics.draw(test, 0, 0, 0, 480/800, 800/1280)
end

function menu:update(dt)
end

function menu:keyreleased(key, code)
    print('key released', key, code)
    if key == 'return' then
        print('enter released')
        _SceneMgr.switch('game')
    end
end


return menu
