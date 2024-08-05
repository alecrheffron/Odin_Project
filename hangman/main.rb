require_relative 'lib/game_word'
require_relative 'lib/setup_game'

def start_new_game
  code_word = WordGame.new("data/words.txt").game_word
  SetupGame.new(code_word)
end

def load_existing_game
  SetupGame.load_game
end

def main_menu
  puts 'Welcome to HANGMAN!!'
  puts '1. Start New Game'
  puts '2. Load Game'
  puts '3. Exit'

  choice = gets.chomp.to_i

  case choice
  when 1
    game = start_new_game
  when 2
    game = load_existing_game
  when 3
    puts 'Goodbye!'
    Exit
  else
    puts 'Not what i asked, select again.'
    main_menu
  end

  game.play
end

main_menu