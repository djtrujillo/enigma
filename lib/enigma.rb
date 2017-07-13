require 'pry'

class Enigma
  attr_accessor :character_map

  def initialize(offset = OffsetCalculator.new) # key = KeyGenerator.new, offset = OffsetCalculator.new
    @character_map = [*("a".."z"), *("0".."9"), " ", ".", ","]
    @offset = offset
    @key = offset.key
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

  def crack(output, date)
      decryptedlastfour = ["n","d",".","."]
      lastfour = find_last_four_elements(output)
      offset_array = find_offsets(date)
      rotated_offset_array = find_offset_rotation(output, offset_array)
      rotation_array = find_key_rotation_numbers(lastfour,decryptedlastfour,rotated_offset_array)
      decrypt_output_array(output, rotation_array, rotated_offset_array)
  end

  def find_key_rotation_numbers(lastfour,decryptedlastfour,rotated_offset_array)
    keyb = (@character_map.find_index(lastfour[0]) - @character_map.find_index(decryptedlastfour[0])) - rotated_offset_array[0]
    keyc = (@character_map.find_index(lastfour[1]) - @character_map.find_index(decryptedlastfour[1])) - rotated_offset_array[1]
    keyd = (@character_map.find_index(lastfour[2]) - @character_map.find_index(decryptedlastfour[2])) - rotated_offset_array[2]
    keya = (@character_map.find_index(lastfour[3]) - @character_map.find_index(decryptedlastfour[3])) - rotated_offset_array[3]
    rotation_array = [keyb, keyc, keyd, keya]
    rotation_array.map! do |key|
      if key < 0
        key = 39 + key
      end
      key
    end
    rotation_array
  end


  def decrypt_output_array(output, rotation_array, rotated_offset_array)
    output_array = message_array(output)
    cracked_array = []
    output_array.each_with_index do |char, index|
      if index % 4 == 1
        cracked_array << decrypt_letter(char, (rotation_array[0]) + rotated_offset_array[0])
      elsif index % 4 ==2
        cracked_array << decrypt_letter(char, (rotation_array[1]) + rotated_offset_array[1])
      elsif index % 4 == 3
        cracked_array << decrypt_letter(char, (rotation_array[2]) + rotated_offset_array[2])
      elsif index % 4 == 0
        cracked_array << decrypt_letter(char, (rotation_array[3]) + rotated_offset_array[3])
      end
    end
    cracked_array.join("")
  end


  def find_last_four_elements(output)
    output_array = output.split("")
    last_four = output_array[-4..-1]
  end

  def find_offsets(date)
    key = KeyGenerator.new
    offset = OffsetCalculator.new(key, date)
    offset.find_offsets
  end

  def find_offset_rotation(output, offset_array)
    output_array = message_array(output)
    output_array.each_with_index do |char, index|
      if index == output_array.count - 4
        if index % 4 == 0
          rotation = 0
        elsif index % 4 == 1
          rotation = 1
        elsif index % 4 == 2
          rotation = 2
        elsif index % 4 == 3
          rotation = 3
        end
        return offset_array.rotate(rotation)
      end
    end
  end
end
