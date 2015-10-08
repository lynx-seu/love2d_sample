-- config
res_root = "assets"
scene_root = "scenes"

-- global value
_scenemgr = require "scenemgr"
_env = require "environment"
cc = {}     -- namespace
cc.vec2 = require "hump.vector"

-- forbid the global
setmetatable(_G, {
    __newindex = function(self, n)
        error ("attempt to write to undeclared variable: " .. n , 2)
    end,
    __index = function(self, n)
        error ("attempt to read undeclared variable: " .. n , 2)
    end,
})
