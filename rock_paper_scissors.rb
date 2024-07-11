ps = 0
cs = 0
gw = 1
puts "What's your name?"
p1 = gets.chomp
loop do
  while ps != gw && cs != gw
    puts "Best #{gw} out of #{gw * 2 - 1}"
    puts "#{p1}: #{ps}, Computer: #{cs}"
    puts "\n"
    puts "Rock, Paper, Scissors!"
    gestures = ["Rock", "Paper", "Scissors"]
    pg = gets.chomp.capitalize
    cg = gestures[rand(0..2)]
    if (pg == gestures[0] && cg == gestures[2]) ||
      (pg == gestures[1] && cg == gestures[0]) ||
      (pg == gestures[2] && cg == gestures[1])
      puts "Ugh I picked #{cg}, you win"
      puts "\n"
      ps += 1
    elsif (cg == gestures[0] && pg == gestures[2]) ||
          (cg == gestures[1] && pg == gestures[0]) ||
          (cg == gestures[2] && pg == gestures[1])
      puts "Ha! I picked #{cg}... you suck!!!"
      puts "\n"
      cs += 1
    elsif pg == cg
      puts "Darn, same here"
      puts "\n"
    else
      puts "That's not what i asked"
      puts "\n"
    end
  end
  if ps == gw
    puts "You got #{gw} so you win!"
  elsif cs == gw
    puts "I got #{gw}, I win so suck it nerd!!"
  end
  puts "Wanna keep going?"
  answer = gets.chomp.capitalize
  if answer == "Yes"
    gw += 1
  elsif answer == "No"
    puts "Final score #{p1}: #{ps}, Computer: #{cs}"
    break
  else
    puts "Whatever if you can't follow instructions then I quit"
    puts "Final score #{p1}: #{ps}, Computer: #{cs}"
    break
  end
end