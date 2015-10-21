--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:83416bc4a12db7e5abbe74c8bc60feab:1/1$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
            -- enemyShip
            x=151,
            y=156,
            width=98,
            height=50,

        },
        {
            -- enemyUFO
            x=140,
            y=208,
            width=91,
            height=91,

        },
        {
            -- laserGreen
            x=140,
            y=157,
            width=9,
            height=33,

        },
        {
            -- laserGreenShot
            x=60,
            y=314,
            width=56,
            height=54,

        },
        {
            -- laserRed
            x=140,
            y=122,
            width=9,
            height=33,

        },
        {
            -- laserRedShot
            x=2,
            y=314,
            width=56,
            height=54,

        },
        {
            -- life
            x=94,
            y=279,
            width=35,
            height=27,

        },
        {
            -- meteorBig
            x=2,
            y=122,
            width=136,
            height=111,

        },
        {
            -- meteorSmall
            x=94,
            y=235,
            width=44,
            height=42,

        },
        {
            -- player
            x=155,
            y=79,
            width=99,
            height=75,

        },
        {
            -- playerDamaged
            x=155,
            y=2,
            width=99,
            height=75,

        },
        {
            -- playerLeft
            x=131,
            y=301,
            width=90,
            height=77,

        },
        {
            -- playerRight
            x=2,
            y=235,
            width=90,
            height=77,

        },
        {
            -- shield
            x=2,
            y=2,
            width=151,
            height=118,

        },
    },
    
    sheetContentWidth = 256,
    sheetContentHeight = 512
}

SheetInfo.frameIndex =
{

    ["enemyShip"] = 1,
    ["enemyUFO"] = 2,
    ["laserGreen"] = 3,
    ["laserGreenShot"] = 4,
    ["laserRed"] = 5,
    ["laserRedShot"] = 6,
    ["life"] = 7,
    ["meteorBig"] = 8,
    ["meteorSmall"] = 9,
    ["player"] = 10,
    ["playerDamaged"] = 11,
    ["playerLeft"] = 12,
    ["playerRight"] = 13,
    ["shield"] = 14,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
