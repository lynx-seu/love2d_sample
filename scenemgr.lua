local mgr = {}

local GS = require "hump.gamestate"
local scene_root = scene_root or "scenes"

function mgr.run()
    GS.registerEvents()
    mgr.switch('menu')
end

function mgr.switch(scene)
    local s = require(scene_root .. '.' .. scene)
    GS.switch(s)
end

return mgr
