local Set = require("set")

local s = Set:new()

s:insert(3)
s:insert(6)
s:insert(5)

print("set size:" .. s:size())

print("element of set: ")
print(s)

print("delete 6 of set")
s:remove(6)

print(s)

local s2 = Set:new({3, 4, 6, 5})
print("set add:")
print(s+s2)
print("set sub:")
print(s-s2)

if s <= s2 then 
    print("s <= s2")
end

