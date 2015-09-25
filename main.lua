
--# called only once, when the game is started
function love.load()
end

--# draw here
function love.draw()
end

--# 'dt' stands for 'delta time'
function love.update(dt)
end

-- mouse event
function love.mousepressed(x, y, button)
    print("mouse down: x = " .. x .. ", y = " .. y)
end

function love.mousereleased(x, y, button)
    print("mouse up: x = " .. x .. ", y = " .. y)
end

-- key event
function love.keypressed(key)
    print(key)
end

function love.keyreleased(key)
    print(key)
end

-- focus event
function love.focus(f)
    if not f then
        print("LOST FOCUS")
    else
        print("GAINED FOCUS")
    end
end

-- quit event
function love.quit()
    print("Thanks for playing! Come back soon!")
end
