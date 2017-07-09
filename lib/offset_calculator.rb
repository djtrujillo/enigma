require 'date'
require 'pry'
class OffsetCalculator
  attr_reader :key,
              :date,
              :a_offset,
              :b_offset,
              :c_offset,
              :d_offset,
              :a_rotation,
              :b_rotation,
              :c_rotation,
              :d_rotation

  def initialize(key)
    @key = key
    @date = Date.new
    @squared_date = 0
    @a_offset
    @b_offset
    @c_offset
    @d_offset
    @a_rotation
    @b_rotation
    @c_rotation
    @d_rotation

  end

  def reformat_date
    month_string = sprintf '%02d', @date.month
    day_string = sprintf '%02d', @date.day
    year_string = sprintf '%02d', @date.year
    year_string[0] = ''
    date_string = "#{month_string}#{day_string}#{year_string}"
    date_string[-4..-3] = ''
    @date = date_string.to_i
  end

  def squared_date
    @squared_date = @date ** 2
  end

  def last_4_digits
    string = @squared_date.to_s
    last_four_string = string[-4..-1]
    last_4_digits = last_four_string.to_i
  end

  def find_offsets
    last_four_string = last_4_digits.to_s

    @a_offset = last_four_string[0].to_i
    @b_offset = last_four_string[1].to_i
    @c_offset = last_four_string[2].to_i
    @d_offset = last_four_string[3].to_i
  end

  def add_offsets_to_rotation
    @a_rotation = @key.a + @a_offset
    @b_rotation = @key.b + @b_offset
    @c_rotation = @key.c + @c_offset
    @d_rotation = @key.d + @d_offset
  end

end
