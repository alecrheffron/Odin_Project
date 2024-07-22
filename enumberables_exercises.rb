inventory_list = {
  milk: 3,
  bread: 5,
  cheese: 7,
  ham: 1,
  mayo: 0
}

def display_current_inventory(list)
  list.each { |item, amount| puts "#{item}, quantity: #{amount}"}
end

guesses = ["cheeseburger", "pizza", "taco"]

def display_guess_order(guesses)
  guesses.each_with_index { |guess, index| puts "Guess #{index + 1} is #{guess}"}
end

numbers = [34, 55, -23, -44]

def find_absolute_values(numbers)
  numbers.map { |number| number.abs}
end

def find_low_inventory(list)
  list.select { |item, amount| amount < 4 }
end

words = ["book", "desk", "library"]

def find_word_length(list)
  list.reduce({}) do |result, word|
    result[word] = word.length
    result
  end
end

display_current_inventory(inventory_list)
display_guess_order(guesses)
puts new_array = find_absolute_values(numbers)
puts find_low_inventory(inventory_list)
puts find_word_length(words)
