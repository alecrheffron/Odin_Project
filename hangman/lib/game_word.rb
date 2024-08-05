class WordGame
  def initialize(file_path)
    @file_path = file_path
  end

  # Pulls a random word for the game
  def game_word
    # Read the words file, then split words into array
    contents = File.read(@file_path)
    content_array = contents.split
    game_word = limit_word_length(content_array)
    game_word.sample
  end

  private

  # Limit the game to words between 5 and 12 characters
  def limit_word_length(word_array)
    word_array.reject { |word| word.length < 5 || word.length > 12 }
  end
end
