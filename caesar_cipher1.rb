def caesar_cipher(string, shift = 4)
  str_array = string.split('')
  numbers = str_array.map { |letter| letter.ord }
  shifted_numbers = numbers.map do |number|
    shifted_number = number

    if number >= 65 && number <= 90 #Uppercase
      shifted_number = number + shift
      shifted_number -= 26 if shifted_number > 90
      shifted_number += 26 if shifted_number < 65
    elsif number >= 97 && number <= 122 #Lowercase
      shifted_number = number + shift
      shifted_number -= 26 if shifted_number > 122
      shifted_number += 26 if shifted_number < 97
    end
    shifted_number
  end
  shifted_string = shifted_numbers.map { |number| number.chr }.join('')
end

ciphered_word = caesar_cipher('Oh, how I long for you, you sexy little thing', -5)
puts ciphered_word
unciphered_word = caesar_cipher(ciphered_word, 5)
puts unciphered_word