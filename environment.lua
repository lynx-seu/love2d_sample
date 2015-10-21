local vec2 = require "hump.vector"

local landscape = false
local screen_size = {
    iphone_3g = vec2(480, 320),
    iphone_4 = vec2(960, 640),
    iphone_5 = vec2(1136, 640),
    ipad = vec2(1024, 768),
    ipad_retina = vec2(2048, 1536),
    android = vec2(800, 480),
    android_1 = vec2(854, 480),
    android_2 = vec2(1280, 720),
    android_3 = vec2(1280, 800),
    android_4 = vec2(1920, 1080),
}

local env = {
    window_size = screen_size.android,
    canvas_size = screen_size.android_3,
    res_root = 'assets',
    external_storage_dir = '',
    scenes_root = 'scenes',
}

function env.getWindowSize()
    local size = env.window_size
    if not landscape then
        return vec2(size.y, size.x)
    end
    return size 
end

function env.getCanvasSize()
    local size = env.canvas_size
    if not landscape then
        return vec2(size.y, size.x)
    end
    return size
end

function env.getResRoot()
    return env.res_root .. "/"
end

function env.getscale()
    local s1 = env.getWindowSize()
    local s2 = env.getCanvasSize()
    return vec2(s1.x/s2.x, s1.y/s2.y) 
end

function env.getScenesRoot()
    return env.scenes_root .. '.'
end

return {
    GetWindowSize = env.getWindowSize,
    GetCanvasSize = env.getCanvasSize,
    GetResRoot = env.getResRoot,
    GetScale = env.getscale,
    GetScenesRoot = env.getScenesRoot,
}

