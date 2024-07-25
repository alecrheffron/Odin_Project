# frozen_string_literal: true

require 'colorize'

# The RockPaperScissors class encapslates the logic for playing a game of Rock, Paper, Scissors
class RockPaperScissors
  def initialize
    @player_score = 0
    @computer_score = 0
    @gestures = %w[Rock Paper Scissors]
  end

  # Starts the game
  def play
    setup_game
    until game_won?
      display_scores
      player_gesture = player_gesture_input
      computer_gesture = @gestures.sample
      process_round(player_gesture, computer_gesture)
    end
    announce_winner
    play_again?
  end

  private

  # Collects player's name and desired winning score
  def setup_game
    puts 'What\'s your name?'.colorize(:blue)
    @player_name = gets.chomp
    puts 'What score do you want to play to?'.colorize(:blue)
    @winning_score = gets.chomp.to_i
  end

  # Checks to see if game has been won
  def game_won?
    @player_score == @winning_score || @computer_score == @winning_score
  end

  # Displays the current scores
  def display_scores
    puts "Best #{@winning_score} out of #{@winning_score * 2 - 1}".colorize(:blue)
    puts "#{@player_name}: #{@player_score} ".colorize(:green) + " Computer: #{@computer_score}\n\n".colorize(:red)
  end

  # Prompts the player for their gesture
  def player_gesture_input
    puts 'Rock, Paper, Scissors!'.colorize(:blue)
    gets.chomp.capitalize
  end

  # Processes a single round of the game
  def process_round(player_gesture, computer_gesture)
    puts "Computer chose: #{computer_gesture}".colorize(:red)
    if winning_combination?(player_gesture, computer_gesture)
      handle_player_win
    elsif winning_combination?(computer_gesture, player_gesture)
      handle_computer_win
    elsif player_gesture == computer_gesture
      handle_tie
    else
      handle_invalid_input
    end
  end

  # Handles a player win scenario
  def handle_player_win
    puts "Ugh, you win this round...\n\n".colorize(:green)
    @player_score += 1
  end

  # Handles a computer win scenario
  def handle_computer_win
    puts "Computer wins.... you NERD!!\n\n".colorize(:red)
    @computer_score += 1
  end

  # Handles a tie
  def handle_tie
    puts "That\'s what I picked...\n\n".colorize(:blue)
  end

  # Handles invalid input
  def handle_invalid_input
    puts "That\s not what I asked...\n\n".colorize(:blue)
  end

  # Checks if first gesture beats the second
  def winning_combination?(first, second)
    (first == 'Rock' && second == 'Scissors') ||
      (first == 'Paper' && second == 'Rock') ||
      (first == 'Scissors' && second == 'Paper')
  end

  # Announces the winner of the game
  def announce_winner
    if @player_score == @winning_score
      puts "Well congrats #{@player_name}, you win...".colorize(:green)
    else
      puts 'Computer wins again!! Down with humanity!!'.colorize(:red)
    end
    puts "Final score - #{@player_name}: #{@player_score}, Computer: #{@computer_score}"
  end

  # Asks the player if they want to play another game
  def play_again?
    puts 'Wanna play again? (Yes,No)'
    answer = gets.chomp.capitalize
    if answer == 'Yes'
      reset_game
      play
    else
      puts 'Fine, be a quitter'
    end
  end

  # Resets the game scores
  def reset_game
    @player_score = 0
    @computer_score = 0
  end
end

game = RockPaperScissors.new
game.play
