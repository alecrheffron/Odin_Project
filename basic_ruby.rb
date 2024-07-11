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
str = "This is a small array"
str_array = str.split(" ")