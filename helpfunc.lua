function handler(obj, method)
    return function(...)
        return method(obj, ...)
    end
end

function implement(...)
    local cls = {}
    local plist = {...}

    setmetatable(cls, {
        __index = function(t, k)
            for i= table.getn(plist), 1, -1 do
                local v = plist[i][k]
                if v then return v end
            end
        end,
        __call = function(t, ...)
            return new(...)
        end,
    })

    cls.__index = cls

    local function new(o)
        o = o or {}
        setmetatable(o, cls)
        return o
    end

    return cls
end

