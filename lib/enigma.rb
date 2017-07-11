require 'pry'

class Enigma
  attr_accessor :character_map

  def initialize
    @character_map = [*("a".."z"), *(0..9), " ", ".", ","]
  end

  def cipher(rotation)
    rotated_characters = @character_map.rotate(rotation)
    Hash[@character_map.zip(rotated_characters)]
  end

  def encrypt_letter(letter, rotation)
    cipher_for_rotation = cipher(rotation)
    cipher_for_rotation[letter]
  end

  def encrypt (message, offset_calculator)
    message_array = message_array(message)
    encrypted_string = message_array.map do |letter|
      encrypt_letter(letter, assign_letter_rotation(message_array, letter, offset_calculator))
    end
    encrypted_string.join
  end


  def assign_letter_rotation(message_array, letter, offset_calculator )
    if message_array.index(letter)    % 4 == 0
      rotation = offset_calculator.a_rotation
    elsif message_array.index(letter) % 4 == 1
      rotation = offset_calculator.b_rotation
    elsif message_array.index(letter) % 4 == 2
      rotation = offset_calculator.c_rotation
    elsif message_array.index(letter) % 4 == 3
      rotation = offset_calculator.d_rotation
    else
    end
    rotation
  end

  def decrypt(output)
  end

  def crack
  end

  def message_array(message)
    message_array = message.split('')
  end


end




# a method that takes message_array and assigns each element A,B,C,D based on index number


# a method that rotates the keys of the hash based on their values the rotation numbers in the char_map







# Four characters are encrypted at a time.
# The first character is rotated forward by the “A” rotation plus the “A offset”
# The second character is rotated forward by the “B” rotation plus the “B offset”
# The third character is rotated forward by the “C” rotation plus the “C offset”
# The fourth character is rotated forward by the “D” rotation plus the “D offset”
