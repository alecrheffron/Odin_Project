def coffee_drink(drink_list)
  drink_list.include?("coffee") ||
  drink_list.include?("espresso")
end
drink_list = ["water",
              "coke",
              "espresso",
              "coffee"]

puts coffee_drink(drink_list)

def correct_guess(guess_list, answer)
  puts guess_list.any? { |guess| guess == answer}
end
guess_list = [3, 4, 5, 6, 7, 8]
answer = 8

correct_guess(guess_list, answer)

def twenty_first_century_years(year_list)
  year_list.all? { |year| year > 2000 && year < 2100}
end
year_list = [2001, 2101, 2099]

puts twenty_first_century_years(year_list)

def correct_format?(word_list)
  word_list.none? { |word| word == word.upcase }
end
word_list = ["CAT",
              "dog",
              "house"]

puts correct_format?(word_list)

def valid_scores?(score_list, perfect_score)
  score_list.one? { |score| score == perfect_score}
end
score_list = [45, 78, 87, 100, 100, 34]
perfect_score = 100

puts valid_scores?(score_list, perfect_score)