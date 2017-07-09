require 'date'
class OffsetCalculator
  attr_reader :key,
              :date

  def initialize(key)
    @key = key
    @date = Date.new
    @squared_date = 0
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

    a = last_four_string[-4].to_i
    a = last_four_string[-3].to_i
    a = last_four_string[-2].to_i
    a = last_four_string[-1].to_i





end
