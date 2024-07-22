def ascii_translator(number)
  number.chr
end

current_sports = ["cheer", "football", "wrestling"]
favorite_sports = ["football", "basketball", "lacrosse"]

def common_sports(list1, list2)
  list1.intersection(list2)
end

games = ["monopoly", "chutes and ladders", "monopoly", "risk", "clue"]

def alphabetical_list(list)
  list.uniq.sort
end

def lucky_number(number = 7)
  "Todays lucky number is #{number}"
end

def ascii_code(string)
  if string.length == 1
    string.ord
  else
    InputError
  end
end


def pet_pun(animal)
  if animal.downcase == "cat"
    puts "Cats are purr-fect!"
  elsif animal.downcase == "dog"
    puts "Dogs are paw-some!"
  else
    puts "I think #{animal}s have pet-tential!"
  end
end

def twenty_first_century?(year)
  if 2000 <= year && year < 2100
    true
  else
    false
  end
end

puts ascii_translator(65)
puts common_sports(current_sports, favorite_sports)
puts alphabetical_list(games)
puts lucky_number(11)
puts ascii_code('M')
pet_pun('elephant')
puts twenty_first_century?(2000)