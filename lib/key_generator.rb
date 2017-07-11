class KeyGenerator
  attr_reader :a,
              :b,
              :c,
              :d

  def initialize(key_string = Array.new(5) { rand(1..9) }.join(''))
    @key_string = key_string
    key
    values

  end

  def key
    key_string_array = @key_string.split('')
    @key = key_string_array.map do |string|
      string.to_i
    end

  end

  def values
    @a = @key.values_at(0,1).join('').to_i
    @b = @key.values_at(1,2).join('').to_i
    @c = @key.values_at(2,3).join('').to_i
    @d = @key.values_at(3,4).join('').to_i
  end

end
