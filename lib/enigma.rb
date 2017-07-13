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
    Hash[@character_map.zip(rotated_characters)]
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


  def message_array(message)
    message_array = message.split('')
  end








  ###################################################
  #Crack Methods
  # find last four of encryption message
  # based on length of the entire message, find ABCD rotation
  # find offset based on the date
  # assign those offsets to the last four




  def crack(output, date)
      lastseven = find_last_seven_elements(output)
      offset_array = find_offsets(date)
      last_seven_minus_offsets = encryption_minus_offsets(output, offset_array)
    # find lastseven rotation assignments
    # iterate through, subtracting how many characters it takes to get to match ..end..
    # if rotations don't match, add 39 to subtraction and try again
    # once ABCD rotations are determined, key should become apparent
  end

  def find_last_seven_elements(output)
    output_array = output.split("")
    last_seven = output_array[-7..-1]
  end

  def find_offsets(date)
    key = KeyGenerator.new
    offset = OffsetCalculator.new(key, date)
    offset.find_offsets
  end

  def encryption_minus_offsets(output, offset_array)
    #rotate our offset_array based on length of message
    output = message_array(output)
    message_minus_outputs = output.each_with_index.map do |char, index|
      if index % 4 == 0
        encrypt_letter(char, 39 - offset_array[0])
      elsif index % 4 == 1
        encrypt_letter(char, 39 - offset_array[1])
      elsif index % 4 == 2
        encrypt_letter(char, 39 - offset_array[2])
      elsif index % 4 == 3
        encrypt_letter(char, 39 - offset_array[3])
      end
    end
    message_minus_outputs[-7..-1]
  end

  # def compare_new_encryption_with_original_message(last_seven_minus_offsets, [".",".","e","n","d",".","."])
  #   last_seven-
  #
  #
  #
  # end





    # every message end with ..end..



end
# a method that takes message_array and assigns each element A,B,C,D based on index number


# a method that rotates the keys of the hash based on their values the rotation numbers in the char_map







# Four characters are encrypted at a time.
# The first character is rotated forward by the “A” rotation plus the “A offset”
# The second character is rotated forward by the “B” rotation plus the “B offset”
# The third character is rotated forward by the “C” rotation plus the “C offset”
# The fourth character is rotated forward by the “D” rotation plus the “D offset”
