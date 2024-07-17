numbers = [21, 42, 303, 499, 550, 811]
element = 42
result = false

puts result
puts
puts "Include?"
# Without include?

numbers.each do |number|
  if number == element
    result = true
    break
  end
end
puts result
result = false
puts result

# With include?
puts numbers.include?(303)
result = false
puts result
puts
puts "any?"

# Without any?

numbers.each do |number|
  if number > 500
    result = true
    break
  end
end
puts result
result = false
puts result

# With any?

puts numbers.any? { |number| number > 500 }


fruits = ["apple", "banana", "strawberry", "pineapple"]
matches = []
result = false
puts result
puts
puts "all?"

# Without all?
fruits.each do |fruit|
  if fruit.length > 3
    matches.push(fruit)
  end
end

result = fruits.length == matches.length
puts result
result = false
puts result

# With all?
puts fruits.all? { |fruit| fruit.length > 3 }
puts
puts "none?"

# Without none?
fruits.each do |fruit|
  if fruit.length > 10
    result = false
    puts result
    break
  end
end

puts fruits.none? { |fruit| fruit.length > 10}