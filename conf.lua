local env = require "environment"

function love.conf(t)
    t.version = "0.9.2"
    t.console = true

    t.window.title = "sudoku"
    --t.window.width = 480 
    --t.window.height = 800
    local size = env.GetWindowSize()
    t.window.width = size.x
    t.window.height = size.y
    t.window.resizable = false

    t.modules.joystick = false
end
