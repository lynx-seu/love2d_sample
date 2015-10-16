local PATH = (...):match('^(.+)%.[^%.]+') .. '.'
local Node = require(PATH .. 'node')

local sprite = Node()
sprite.__index = sprite

local function new(o)
    o = o or {}
    return setmetatable(o, sprite)
end


return setmetatable({new=new}, {__call=function(_, ...) new(...) end})
