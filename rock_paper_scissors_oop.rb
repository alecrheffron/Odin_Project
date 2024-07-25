class RockPaperScissors
  def rock_paper_scissors()
    ps = 0 # Player score
    cs = 0 # Computer score
    puts "What's your name?"
    p1 = gets.chomp
    puts "What do you want to play to: "
    gw = gets.chomp.to_i # Score to win
    loop do
      while ps != gw && cs != gw
        puts "Best #{gw} out of #{gw * 2 - 1}"
        puts "#{p1}: #{ps}, Computer: #{cs}"
        puts "\n"
        puts "Rock, Paper, Scissors!"
        gestures = ["Rock", "Paper", "Scissors"]
        pg = gets.chomp.capitalize
        cg = gestures[rand(0..2)]
        if (pg == gestures[0] && cg == gestures[2]) || # Human Rock beats Scissors
           (pg == gestures[1] && cg == gestures[0]) || # Human Paper beats Rock
           (pg == gestures[2] && cg == gestures[1])    # Huamn Scissors beats Paper
          puts "Ugh I picked #{cg}, you win"
          puts "\n"
          ps += 1
        elsif (cg == gestures[0] && pg == gestures[2]) || # Puter Rock beats Scissors
              (cg == gestures[1] && pg == gestures[0]) || # Puter Paper beats Rock
              (cg == gestures[2] && pg == gestures[1])    # Puter Scissors beats Paper
          puts "Ha! I picked #{cg}... you suck!!!"
          puts "\n"
          cs += 1
        elsif pg == cg # Tie
          puts "Darn, same here"
          puts "\n"
        else # Unaccepted input
          puts "That's not what i asked"
          puts "\n"
        end
      end
      if ps == gw # Player win
        puts "You got #{gw} so you win!"
      elsif cs == gw # Computer win
        puts "I got #{gw}, I win so suck it nerd!!"
      end
      puts "Wanna keep going?"
      answer = gets.chomp.capitalize
      if answer == "Yes" # Keep playing
        gw += 1
      elsif answer == "No" # Done playing
        puts "Final score #{p1}: #{ps}, Computer: #{cs}"
        break
      else
        puts "Whatever if you can't follow instructions then I quit"
        puts "Final score #{p1}: #{ps}, Computer: #{cs}"
        break
      end
    end
  end
end
