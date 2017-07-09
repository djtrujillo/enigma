class KeyGenerator
  attr_accessor :key,
                :a,
                :b,
                :c,
                :d

  def initialize
    @key = Array.new(5) { rand(1..9) }
    @a = @key.values_at(0,1)
    @b = @key.values_at(1,2)
    @c = @key.values_at(2,3)
    @d = @key.values_at[3,4]
  end



  # initialize method, key that is a 5 digit number
  # initialize that key to an array of numbers
  # assign the first two indexes of that array to the variable A
  # second and third indexes will be B and so on...
end
