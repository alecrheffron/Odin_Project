def sub_strings(string, dictionary)
  result = Hash.new(0) # Initialize a hash with default value of 0

  string_words = string.downcase.split # Split the input string into words and downcase
  dictionary.each do |dict_word|
    dict_word_downcase = dict_word.downcase
    string_words.each do |str_word|
      result[dict_word_downcase] += 1 if str_word.include?(dict_word_downcase)
    end
  end

  result
end

string = "Howdy parter, sit down! How's it goings?"
dictionary = %w[below down go going horn how howdy it i
                low own part partner sit]
p sub_strings(string, dictionary)
# Split main string into array and lower case it
# Iterate through array with each dictionary word to see if it exists in the string
# Return a hash listing each substring and how many times it was found
