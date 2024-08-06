# frozen_string_literal: true

class SetupGame
  def initialize(code_word)
    @code_word = code_word
    @blank_word = make_blank_word(@code_word)
    @board = [
      ['_____  '],
      ['   |   '],
      ['   O   '],
      ['  /|\\  '],
      ['   |   '],
      ['  / \\  ']
    ]
    @used_letters = []
    @guesses_made = 0
  end

  def play
    until game_over?
      process_round
      if letter_exist?
        compare_words(@guess)
      else
        @guesses_made += 1
      end
    end
    game_finish
  end

  # Serialization: Save game state
  def save_game(file_path = 'save_game.dat')
    File.open(file_path, 'wb') do |file|
      Marshal.dump(self, file)
    end
  end

  # Deserialization: Load game state
  def self.load_game(file_path = 'save_game.dat')
    File.open(file_path, 'rb') do |file|
      Marshal.load(file)
    end
  end

  private

  def process_round
    # ask_to_save_game
    print_board
    print_blank_word
    puts "You have #{5 - @guesses_made} guesses left!"
    guess_a_letter
  end

  def ask_to_save_game
    puts 'Would you like to save the game? (y/n)'
    return unless gets.chomp.downcase == 'y'

    save_game
    puts 'Game saved!'
  end

  # Prints the blank word
  def print_blank_word
    puts @blank_word.join(' ')
  end

  # Prints the board
  def print_board
    puts @board[0..@guesses_made]
  end

  def modify_blank_word(guess, index)
    @blank_word[index] = guess
  end

  def compare_words(guess)
    code_array = @code_word.split('')
    code_array.each_with_index do |letter, index|
      modify_blank_word(guess, index) if letter == guess
    end
  end

  def guess_a_letter
    puts "Already used letters: #{@used_letters.join(', ')}"
    puts 'Guess a letter: '
    @guess = gets.chomp.downcase
    @used_letters << @guess unless @used_letters.include?(@guess)
  end

  # Checks if letter is in the code word
  def letter_exist?
    @code_word.include?(@guess)
  end

  # Defines a player win
  def player_win?
    @blank_word.join('') == @code_word
  end

  # Defines a player loss
  def player_lose?
    @guesses_made == 5
  end

  # Defines when the game is over
  def game_over?
    player_win? || player_lose?
  end

  # Prints final game results
  def game_finish
    puts 'Congrats!! You win!' if player_win?
    return unless player_lose?

    print_board
    puts "You are out of guesses, you lose... oh by the way the word was #{@code_word}"
  end

  # Makes the code word into '_' for the board
  def make_blank_word(code_word)
    code_word.gsub(/[A-Za-z]/, '_').split('')
  end

end
