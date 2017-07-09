require 'pry'

class Enigma
  attr_accessor :character_map

  def initialize(key_generator, offset_calculator)
    @character_map = [("a".."z"), (1..9), " ", ".", ","]
    @encryptor
    @key_generator
    @offset_calculator
  end

  def Encryptor
    

end
