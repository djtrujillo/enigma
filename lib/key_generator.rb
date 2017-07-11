class KeyGenerator
  attr_reader :key,
              :a,
              :b,
              :c,
              :d

  def initialize
    @key = Array.new(5) { rand(1..9) }
    @a = @key.values_at(0,1).join('').to_i
    @b = @key.values_at(1,2).join('').to_i
    @c = @key.values_at(2,3).join('').to_i
    @d = @key.values_at(3,4).join('').to_i
  end
 
end
