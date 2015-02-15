function ends_in_3(num)
  local num_as_string = tostring(num)
  return string.sub(num, -1) == '3'
end

print(ends_in_3("43"))
print(ends_in_3("42"))