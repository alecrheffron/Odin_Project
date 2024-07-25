# frozen_string_literal: true

# The CaesarCipher class provieds functionality to encode a string using the Caesar cipher technique
class CaesarCipher
  # Initialized a new CaesarCipher object
  #
  # @param string [String] the string to be encoded
  # @param shift [Integer] the number of positions to shift each character (default: 4)
  def initialize(string, shift = 4)
    @string = string
    @shift = shift
  end

  # Encodes the string using the Caesar cipher technique
  #
  # @return [String] the encoded string
  def encode
    @string.chars.map { |char| shift_char(char) }.join
  end

  private

  # Shifts a character by the given shift amount
  #
  # @param char [String] the character to shift
  # @return [String] the shifted character
  def shift_char(char)
    if char =~ /[A-Z]/
      shift_within_range(char, 65, 90)
    elsif char =~ /[a-z]/
      shift_within_range(char, 97, 122)
    else
      char
    end
  end

  # Shifts a character within the specified ASCII range
  #
  # @param char [String] the character to shift
  # @param range_start [Integer] the start of the ASCII range
  # @param range_end [Integer] the end of the ASCII range
  # @return [String] the shifted character
  def shift_within_range(char, range_start, range_end)
    shifted = char.ord + @shift
    if shifted > range_end
      (shifted - 26).chr
    elsif shifted < range_start
      (shifted + 26).chr
    else
      shifted.chr
    end
  end
end

# Example usage:
cipher = CaesarCipher.new('Oh, how I long for you, you sexy little thing', -5)
p cipher.encode
