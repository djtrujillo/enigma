require 'pry'

class Enigma
  attr_accessor :character_map

  def initialize
    @character_map = [("a".."z"), (1..9), " ", ".", ","]
    @encryptor

  end

  def encrypt(message)
  end

  def decrypt(output)
  end

  def crack
  end

  def message_array(message)
    # a method that takes our message turns it into an array of all the chars
    message_array = message.split('')
  end

  def message_hash(message)

    #  a method that takes message_array and assigns each element A,B,C,D based on index number

    # return a hash where the keys are the characters in the message and the values are A B C D

  end



end




# a method that takes message_array and assigns each element A,B,C,D based on index number


# a method that rotates the keys of the hash based on their values the rotation numbers in the char_map







# Four characters are encrypted at a time.
# The first character is rotated forward by the “A” rotation plus the “A offset”
# The second character is rotated forward by the “B” rotation plus the “B offset”
# The third character is rotated forward by the “C” rotation plus the “C offset”
# The fourth character is rotated forward by the “D” rotation plus the “D offset”
