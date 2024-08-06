class ConcatStrings
  def what_it_say
    puts "welcome " + "to your moms"
    puts "welcome " << "to your moms"
    puts "welcome ".concat("to your moms")
  end
end

class SubStrings
  def what_it_say
    puts "hello"[0]
    puts "hello"[0, 3]
    puts "hello"[-1]
  end
end
whatitsay = SubStrings.new
whatitsay.what_it_say
# Different ways to set up either/or response
'
if 1 < 2
  puts "Hot diggity damn, 1 is less than 2"
end

puts "Hot diggity damn, 1 is less than 2" if 1 < 2


puts "Party at Kevin\'s" if 1 < 1 || 5 < 6


puts "Age?"
age = gets.chomp.to_i
response = age < 18 ? "You young" : "you old"
puts response
'
# String and array modification
'
str = "This is a small array"
str_array = str.split(" ")
str_array.first(2)
str_array.last(2)
'

# Hashes

# Rocket syntax
my_hash = {
  "random word" => "ahoy",
  "Tess's boobs" => "pretty nice",
  "array" => [0, 1, 2, 3],
  "inception hash" => {},
  :six => 6
}

my_hash["city"] = "The Colony"
puts my_hash["city"]

my_hash["Tess's boobs"] = "Very Nice"
puts my_hash["Tess's boobs"]

puts my_hash["array"][2]

# Methods
my_hash.delete("random word")


my_hashes = {"hello" => "kitty"}
my_hash.merge(my_hashes)

puts my_hash.keys
puts my_hash.values

#Symbols syntax
japanese_cars = {
  Honda: "Accord",
  Toyota: "Corolla",
  Nissan: "Altima"
}
puts japanese_cars[:Honda]
