def display_current_inventory(inventory_list)
  inventory_list.each { |item, amount| puts "#{item}, quantity: #{amount}"}
end
inventory_list = {Milk: 2,
                  Bread: 3,
                  Water: 24}

display_current_inventory(inventory_list)

def display_guess_order(guesses)
  guesses.each_with_index { |guess, index| puts "Guess \##{index + 1} is #{guess}"}
end
guesses = ["balloon",
            "elephant",
            "cargo plane"]

display_guess_order(guesses)

def find_absolute_values(numbers)
  puts numbers.map { |number| number.abs }
end
numbers = [4,6, -2, 11]

find_absolute_values(numbers)

def find_low_inventory(inventory_list)
  puts inventory_list.select { |item, amount| amount < 4 }
end

find_low_inventory(inventory_list)

def find_word_lengths(word_list)
  word_list.reduce({}) do |result, word|
    result[word] = word.length
    result
  end
end

word_list = ["weiner", "gonads", "tuberculosis"]
puts find_word_lengths(word_list)