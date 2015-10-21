-- config
GAME_RES = {
    "main"
}

require "helpfunc"

-- global value
_scenemgr = require "scenemgr"
_env = require "environment"
cc = {}     -- namespace
cc.vec2 = require "hump.vector"
cc.rect = require "base.rect"

-- forbid the global
setmetatable(_G, {
    __newindex = function(self, n)
        error ("attempt to write to undeclared variable: " .. n , 2)
    end,
    __index = function(self, n)
        error ("attempt to read undeclared variable: " .. n , 2)
    end,
})
