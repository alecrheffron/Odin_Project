# Split string into array
# Iterate through array and shift to left(-) or right(+)
# Puts array back into a string
# Return Cipher

def caesar_cipher(string, shift = 1)
  alphabet = Array('a'..'z')
  non_caps = Hash[alphabet.zip(alphabet.rotate(shift))]

  alphabet = Array('A'..'Z')
  caps     = Hash[alphabet.zip(alphabet.rotate(shift))]

  encrypter = non_caps.merge(caps)

  string.chars.map {  |c| encrypter.fetch(c, c) }
end
puts 'What would you like to cipher: '
word = gets.chomp
puts 'And cipher code: '
code = gets.chomp
number = code.to_i
p caesar_cipher(word, number).join
