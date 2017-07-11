require 'pry'

class Enigma
  attr_accessor :character_map

  def initialize(offset = OffsetCalculator.new) # key = KeyGenerator.new, offset = OffsetCalculator.new
    @character_map = [*("a".."z"), *("0".."9"), " ", ".", ","]
    @offset = offset
    @key = offset.key
    # @key = key
    # @offset = offset

  end

  def cipher(rotation)
    rotated_characters = @character_map.rotate(rotation)
    hash = Hash[@character_map.zip(rotated_characters)]
  end

  def encrypt_letter(letter, rotation)
    cipher_for_rotation = cipher(rotation)
    cipher_for_rotation[letter]

  end

  def decrypt_letter(letter, rotation)
    cipher_for_rotation = cipher(rotation)
    cipher_for_rotation.key(letter)
  end

  def encrypt (message, key = @key, date = @offset.date)
    if key != @key
      keygenerator = KeyGenerator.new(key)
      @offset = OffsetCalculator.new(keygenerator, date)
    else
    end
    message_array = message_array(message)
    encrypted_array = message_array.each_with_index.map do |letter, index|
      encrypt_letter(letter, assign_letter_rotation(index, @offset))
    end
    encrypted_array.join
  end

  def decrypt (output, key = @key, date = @offset.date)
    if key != @key
      keygenerator = KeyGenerator.new(key)
      @offset = OffsetCalculator.new(keygenerator, date)
    else
    end
    message_array = message_array(output)
    decrypted_string = message_array.each_with_index.map do |letter, index|
      decrypt_letter(letter, assign_letter_rotation(index, @offset))
    end
    decrypted_string.join
  end

  def assign_letter_rotation(index, offset)
    if index    % 4 == 0
      rotation = @offset.a_rotation
    elsif index % 4 == 1
      rotation = @offset.b_rotation
    elsif index % 4 == 2
      rotation = @offset.c_rotation
    elsif index % 4 == 3
      rotation = @offset.d_rotation
    else
    end
    rotation
  end

  def crack(output, date)
    key = "12345"
    # every message end with ..end..


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
