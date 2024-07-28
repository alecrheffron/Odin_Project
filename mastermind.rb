# frozen_string_literal: true

require 'colorize'

# All functionality to play the game Mastermind
class Mastermind
  def initialize
    @colors = %w[red green blue yellow pink orange]
    @attempts = 0
  end

  def play
    generate_code
    until game_over?
      player_guess
      feedback
    end
  end

  def game_over?
    if game_won?
      player_win
      true
    elsif max_attempts_reached?
      player_loss
      true
    else
      increment_attempts
      false
    end
  end

  def player_win
    puts 'Congrats! You broke the code!'
  end

  def player_loss
    puts "That's all ten guesses... you lose"
    puts "The code was #{@code}"
  end

  def feedback
    right_color_right_spot
    right_color_wrong_spot
    puts 'No pins' if no_pins?
  end

  def generate_code
    @code = Array.new(4) { @colors.sample }
  end

  def player_guess
    puts "What's your guesses (red/green/blue/yellow/pink/orange)"
    @player_guess = []
    4.times do |i|
      print "Guess #{i + 1}: "
      @player_guess << gets.chomp.downcase
    end
  end

  def red_pin
    'O'.colorize(:red)
  end

  def white_pin
    'O'.colorize(:white)
  end

  def right_color_right_spot
    @red_pins = 0
    @player_guess.each_with_index do |guess, index|
      if guess == @code[index]
        puts red_pin
        @red_pins += 1
      end
    end
  end

  def right_color_wrong_spot
    @white_pins = 0
    used_indexes = []

    @player_guess.each_with_index do |guess, index|
      next if guess == @code[index] || used_indexes.include?(@code.index(guess))

      next unless @code.include?(guess)

      puts white_pin
      @white_pins += 1
      used_indexes << @code.index(guess)
    end
  end

  def no_pins?
    @red_pins.zero? && @white_pins.zero?
  end

  private

  def game_won?
    @code == @player_guess
  end

  def max_attempts_reached?
    @attempts >= 10
  end

  def increment_attempts
    @attempts += 1
  end
end

game = Mastermind.new
game.play
