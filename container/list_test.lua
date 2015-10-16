local List = require("list")

local l = List:new()

function printlist(list)
    for value in list:iter() do 
        io.write(value .. " ")
    end
    print()
end

-- l:  7 8 6 3 4 5
l:push(3)
l:push(4)
l:push(5)
l:unshift(6)
l:unshift(8)
l:unshift(7)
printlist(l)


while not l:empty() do
    local random = math.random(2)
    if random == 1 then
        l:shift()
    elseif random == 2 then
        l:pop()
    end
    printlist(l)
end

return List
