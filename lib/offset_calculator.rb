require 'date'
require 'pry'
class OffsetCalculator
  attr_reader :key,
              :a_rotation,
              :b_rotation,
              :c_rotation,
              :d_rotation,
              :date

  def initialize(key = KeyGenerator.new, date = Date.today)
    @key_generator = key
    @key = key.key
    @date = date
    reformat_date
    squared_date
    find_offsets
    add_offsets_to_rotation
  end

  def reformat_date
    string = "#{@date.mday}#{@date.mon.to_s.rjust(2, "0")}#{@date.year.to_s[-2..-1]}"
    string.to_i
  end

  def squared_date
    reformat_date ** 2
  end

  def last_4_digits
    string = squared_date.to_s
    string[-4..-1]
  end

  def find_offsets
    offset_string_array = last_4_digits.split("")
    offset_array = offset_string_array.map do |string|
      string.to_i
    end
  end

  def add_offsets_to_rotation
    @a_rotation = @key_generator.a + find_offsets[0]
    @b_rotation = @key_generator.b + find_offsets[1]
    @c_rotation = @key_generator.c + find_offsets[2]
    @d_rotation = @key_generator.d + find_offsets[3]

  end

  # def run_methods
  #   reformat_date
  #   squared_date
  #   find_offsets
  #   add_offsets_to_rotation
  # end

end
