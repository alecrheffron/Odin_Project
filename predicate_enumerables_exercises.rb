drink_list = ["coffee", "espresso", "coke", "wine", "beer"]

def coffee_drink?(list)
  list.include?("coffee") ||
  list.include?("espresso")
end

guess_list = [54, 765, 235, 8576, 2]

def correct_guess?(list, answer)
  list.any?(answer)
end

year_list = [2000, 2099, 2100]

def twenty_first_century_years?(list)
  list.all? { |year| year < 2100 && year > 1999 }
end

word_list = ["super", "DUPEr", "okey dokey"]

def correct_format?(list)
  list.none? { |word| word == word.upcase }
end

score_list = {
  Charles: 77,
  Tess: 100,
  Alec: 100
}

def valid_scores?(list, perfect_score)
  list.one? { |student, score| score == perfect_score }
end

puts coffee_drink?(drink_list)
puts correct_guess?(guess_list, 2)
puts twenty_first_century_years?(year_list)
puts correct_format?(word_list)
puts valid_scores?(score_list, 100)