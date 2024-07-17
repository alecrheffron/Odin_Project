# Same thing 3 different ways

friends = ["Sharon", "Leo", "Leila", "Brian", "Arun"]
invited_list = []

# 1
for friend in friends
  if friend != 'Brian'
  invited_list.push(friend)
  end
end

#2
friends.select { |friend| friend != 'Brian'}

#3
friends.reject { |friend| friend == 'Brian'}


# Using {..} instead of do..end, better for shorter
friends.each { |friend| puts "Hello, " + friend }

my_array = [1, 2]

# Using do..end instead of {..}, better for longer to make easier to read
my_array.each do |num|
  num *= 2
  puts "The new number is #{num}."
end

# Examples with hashes
my_hash = {one: 1, "two" => 2}
my_hash.each {|key, value| puts "#{key} is #{value}" }
my_hash.each {|pair| puts "the pair is #{pair}" }

# each_with_index
fruits = ["apple", "banana", "strawberry", "pineapple"]
fruits.each_with_index { |fruit, index| puts fruit if index.even? }

# map method
friends.map { |friend| friend.upcase }

my_order = ['medium Big Mac', 'medium fries', 'medium milkshake']

my_order.map { |item| item.gsub('medium', 'extra large') }

# select method
friends.select { |friend| friend != 'Brian' }

responses = {'Sharon' => 'yes', 'Leo' => 'no', 'Leila' => 'no', 'Arun' => 'yes'}
puts responses.select { |person, response| response == 'yes'}

# Reduce method
# Without Reduce
my_numbers = [5, 6, 7, 8]
sum = 0

# my_numbers.each { |number| sum += number }

# Now with the reduce method
my_numbers.reduce { |sum, number| sum + number}

# More reduce examples

votes = ["dirty burger", "bistro", "dirty burger"]

result = votes.reduce(Hash.new(0)) do |result, vote|
  result[vote] += 1
  result
end
puts result