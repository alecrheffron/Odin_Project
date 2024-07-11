# Loop Examples

i = 1
loop do
  puts "best #{i} out of #{i * 2 -1}"
  puts "wanna play again?"
  response = gets.chomp
  if response == "yes"
    i += 1
  else
    break
  end
end

while i < 10 do
  puts "i is #{i}"
  i += 1
end

while gets.chomp != "yes" do
  puts "Are we there yet"
end

until i >= 10 do
  puts "i is #{i}"
  i += 1
end

for i in 0..5
  puts "#{i} zombies incoming"
end

5.times do
  puts "hello, world"
end

5.times do |number|
  puts "Alternative fact number#{number}"
end

5.upto(10) { |num| print "#{num} " }

10.downto(5) { |num| print "#{num} " }