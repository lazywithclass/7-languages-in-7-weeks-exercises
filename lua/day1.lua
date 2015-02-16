function ends_in_3(num)
  local num_as_string = tostring(num)
  return string.sub(num, -1) == '3'
end

print("43 ends in 3: " .. tostring(ends_in_3("43")))
print("42 ends in 3: " .. tostring(ends_in_3("42")))

function is_prime(n)
  index = 0
  repeat
    index = index + 1
    if n % index == 0 and index ~= 1 and index ~= n then
      return false
    end
  until index == n
  return true
end

print("4 is prime: " .. tostring(is_prime(4)))
print("3 is prime: " .. tostring(is_prime(3)))
print("12 is prime: " .. tostring(is_prime(12)))
print("17 is prime: " .. tostring(is_prime(17)))

function print_first_primes_ending_in_3(n)
  for i = 1, n do
    if is_prime(i) and ends_in_3(i) then
      print(i)
    end
  end
end

print("first 10 numbers that are prime and end in 3")
print_first_primes_ending_in_3(10)
print("first 33 numbers that are prime and end in 3")
print_first_primes_ending_in_3(33)


