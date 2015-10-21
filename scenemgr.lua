local mgr = {}

local GS = require "hump.gamestate"

function mgr.run()
    GS.registerEvents()
    mgr.switch(_env.GetScenesRoot() .. 'menu')
end

function mgr.switch(scene)
    local s = require(scene)
    s.mod = scene
    GS.switch(s)
end

return mgr
