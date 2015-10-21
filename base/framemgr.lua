local LG = love.graphics
local Rect = cc.rect

local framemgr = {
    -- 所有quad数量
    count = 0,
    -- 存放加载后的图片资源
    frames = {},
}

local first = false

local function getsource(str)
    return _env.GetResRoot() .. str
end

function framemgr:load()
    if first then return end
    first = true
    -- 计算所有资源数量
    for _, v in ipairs(GAME_RES) do
        local sheet = require(getsource(v))
        local t = sheet:getSheet().frames
        self.count = self.count + #t
    end

    for _, v in ipairs(GAME_RES) do
        self:addSheet(v)
    end
end

function framemgr:addSheet(name)
    local sheet = require(getsource(name))
    local frames = sheet:getSheet().frames

    local img = LG.newImage(getsource(name) .. '.png')

    for k, v in pairs(sheet.frameIndex) do
        local r = frames[v]
        local rect = Rect(r.x, r.y, r.width, r.height)
        self.frames[k] = {
            img = img,
            rect = rect, 
        }
    end
end

function framemgr:getFrame(name)
    print(self)
    local t = self.frames[name] 
    --local quad = LG.newQuad(t.rect:unpack())
    return t.img, t.rect
end



return framemgr
