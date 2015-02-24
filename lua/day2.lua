-- utility function to print tables
function table_to_string(t)
  local result = {}
  for k, v in pairs(t) do
    result[#result + 1] = k .. ":" .. v
  end
  return table.concat(result, "\n")
end

function concatenate(a1, a2)
  local newA = a1
  for i = 1, #a2 do
    newA[#newA + 1] = a2[i]
  end
  return newA
end

print("{1,2,3} concatenated to {4,5,6} is ")
print(table_to_string(concatenate({1,2,3}, {4,5,6})))


--strict table that throws a runtime error when
--  reading a nonexistent key
--  overwriting an existing key
local _private = {}
function strict_read(table, key)
  if _private[key] then
    return _private[key]
  else
    error("Invalid key: " .. key)
  end
end

function strict_write(table, key, value)
  if value and _private[key] then
    error("Duplicate key: " .. key)
  else
    _private[key] = value
  end
end

local mt = {
  __index = strict_read,
  __newindex = strict_write
}

local treasure = {}
setmetatable(treasure, mt)
print('call')
treasure.gold = 200
print('treasure should be 200', treasure.gold)
treasure.gold = nil
-- gold is not anymore there

global_mt = {
  __newindex = function(t, k, v)
    setmetatable(t, { __add = concatenate })
    setmetatable(v, { __add = concatenate })
    t[k] = v
  end
}
setmetatable(_G, global_mt)
table1 = {1, 2}
table2 = {3, 4}
print("{1, 2} + {3, 4} is")
print(table_to_string(table1 + table2))
