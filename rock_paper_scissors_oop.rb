# frozen_string_literal: true

class RockPaperScissors
  def initialize
    @player_score = 0
    @computer_score = 0
    @gestures = ['Rock', 'Paper', 'Scissors']
  end

  def play
    setup_game
    until game_won?
      display_scores
      player_gesture = get_player_gesture
      computer_gesture = @gestures.sample
      determine_winner(player_gesture, computer_gesture)
    end
    announce_winner
    play_again?
  end

  private

  def setup_game
    puts 'What\'s your name?'
    @player_name = gets.chomp
    puts 'What score do you want to play to?'
    @winning_score = gets.chomp.to_i
  end

  def game_won?
    @player_score == @winning_score || @computer_score == @winning_score
  end

  def display_scores
    puts "Best #{@winning_score} out of #{@winning_score * 2 - 1}"
    puts "#{@player_name}: #{@player_score}, Computer: #{@computer_score}\n\n"
  end

  def get_player_gesture
    puts 'Rock, Paper, Scissors!'
    gets.chomp.capitalize
  end

  def determine_winner(player_gesture, computer_gesture)
    puts "Computer chose: #{computer_gesture}"
    if winning_combination?(player_gesture, computer_gesture)
      puts "Ugh, you win this round...\n\n"
      @player_score += 1
    elsif winning_combination?(computer_gesture, player_gesture)
      puts "Computer wins.... you NERD!!\n\n"
      @computer_score += 1
    elsif player_gesture == computer_gesture
      puts "That\'s what I picked...\n\n"
    else
      puts "That\s not what I asked...\n\n"
    end
  end

  def winning_combination?(first, second)
    (first == 'Rock' && second == 'Scissors') ||
    (first == 'Paper' && second == 'Rock') ||
    (first == 'Scissors' && second == 'Paper')
  end

  def announce_winner
    if @player_score == @winning_score
      puts "Well congrats #{@player_name}, you win..."
    else
      puts 'Computer wins again!! Down with humanity!!'
    end
    puts "Final score - #{@player_name}: #{@player_score}, Computer: #{@computer_score}"
  end

  def play_again?
    puts 'Wanna play again? (Yes,No)'
    answer = gets.chomp.capitalize
    if answer == 'Yes'
      raise_score
      play
    else
      puts 'Fine, be a quitter'
    end
  end

  def raise_score
    @winning_score += 1
  end
end

game = RockPaperScissors.new
game.play