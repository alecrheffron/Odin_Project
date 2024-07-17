test_scores = [
  [97, 76, 79, 93],
  [79, 84, 76, 79],
  [88, 67, 64, 76],
  [94, 55, 67, 82]
]

teacher_mailboxes = [
  ["Adams", "Baker", "Clark", "Davis"],
  ["Jones", "Lewis", "Lopez", "Moore"],
  ["Perez", "Scott", "Smith", "Young"]
]

puts test_scores[3][-1]
puts teacher_mailboxes[0][-1]

# The second value when creating nested arrays with <Array.new> should
# only be used with an immutable as it will change the value of ALL arrays
# if one is changed
mutable = Array.new(3, Array.new(2))
mutable[0][0] = 1000

''' Returns
[[1000, nil], [1000, nil], 1000, nil]
'''

# Omitting second argument and passes the mutable value in a block

immutable = Array.new(3) { Array.new(2) }
immutable[0][0] = 1000

''' Returns
[[1000, nil], [nil, nil], [nil, nil]]
'''


# Adding and removing from a nested array
test_scores << [100, 99, 98, 97]
test_scores[0].push(100)
puts test_scores[0]
puts
test_scores.pop
test_scores[0].pop
puts test_scores[0]
puts

# Iterating over a nested array
''' Nested enumerable inside of an enumerable'''
teacher_mailboxes.each_with_index do |row, row_index|
  row.each_with_index do |teacher, column_index|
    puts "Row:#{row_index} Column:#{column_index}= #{teacher}"
  end
end

teacher_mailboxes.flatten.each do |teacher|
  puts "#{teacher} is amazing!"
end

# Do any have all scores over 80?
test_scores.any? do |scores|
   scores.all? { |score| score > 80 }
end
'''false'''

# Do all have any scores over 80?
test_scores.all? do |scores|
  scores.any? { |score| score > 80 }
end
'''true'''


# Accessing nested hashes
vehicles = {
  alice: {year: 2019, make: "Toyota", model: "Corrola"},
  blake: {year: 2020, make: "Volkwagen", model: "Beetle"},
  caleb: {year: 2020, make: "Honda", model: "Accord"}
}
puts vehicles[:alice][:year]
puts vehicles[:blake][:make]
puts vehicles[:caleb][:model]

# Its a good idea to use #dig method as it will prevent a 'no method error'
# if the hash is nonexistent
# vehicles[:zoe][:year]
# no method error
vehicles.dig(:zoe, :year)
# nil


# Adding and removing data

# Adding a whole new key
vehicles[:dave] = {year: 2021, make: "Ford", model: "Escape"}

# Adding a new value/key
vehicles[:dave][:color] = "red"

# Deleting a whole key
vehicles.delete(:blake)

#Deleting a specific value
vehicles[:dave].delete(:color)


# Methods for nesteds

# This works for searching but it returns the entire hash
vehicles.select { |name, data| data[:year] >= 2020 }

# To return just the owners, but unfortunately also a 'nil' when it was false
vehicles.collect { |name, data| name if data[:year] >= 2020 }

# The compact method fixes this by returning an array or hash with 'nil's removed
vehicles.collect { |name, data| name if data[:year] >= 2020 }.compact

# Or we can just do it the smart way that combines both
puts vehicles.filter_map { |name, data| name if data[:year] >= 2020 }
