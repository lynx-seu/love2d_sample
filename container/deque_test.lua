local Deque = require("deque")

local deq = Deque:new()

deq:push(1)
deq:push(5)
deq:push(8)
deq:push(3)
deq:push(0)

deq:shift()
deq:pop()

for k, v in deq:iter() do
    print (k, v)
end
