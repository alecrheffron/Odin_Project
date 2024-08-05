require_relative 'lib/game_word'
require_relative 'lib/setup_game'

word_game = WordGame.new("data/words.txt")
code_word = word_game.game_word

blanks = SetupGame.new(code_word)
blanks.round_processer