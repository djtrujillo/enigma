require 'pry'

class KeyGenerator
    attr_accessor :key


  def initialize
    @key = Array.new(5) { rand(1..9) }
    @a
    @b
    @c
    @d
  end


  def index_assign
    # if the number in the array is in the 0 and 1 index
    # set it to variable A
    @a = random_array.values_at(0,1)
      # if random number in array is n the 1 and 2 index
      # set it to variabe B
    @b = random_array.values_at(1,2)
      # if random number in array is in the 2 and 3 index
      # set it to varaible C
    @c = random_array.index(2,3)
      # if random number in the array is in the 3 and 4 index
      # set it to variable D
    @d = random_array.index[3,4]
  end

  # initialize method, key that is a 5 digit number
  # initialize that key to an array of numbers
  # assign the first two indexes of that array to the variable A
  # second and third indexes will be B and so on...
end
