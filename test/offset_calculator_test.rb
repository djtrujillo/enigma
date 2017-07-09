require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset_calculator'
require './lib/key_generator'
require 'date'

class OffsetCalculatorTest < Minitest::Test
  def test_offset_calculator_exists
    key_generator = KeyGenerator.new
    key = key_generator.key
    offset = OffsetCalculator.new(key)

    assert_instance_of OffsetCalculator, offset
  end

  def test_offset_calculator_initializes_with_key_generator_instance
    key_generator = KeyGenerator.new
    key = key_generator
    offset = OffsetCalculator.new(key)


    assert_instance_of KeyGenerator, offset.key
  end

  def test_offset_calculator_initiates_with_date
    key_generator = KeyGenerator.new
    key = key_generator
    offset = OffsetCalculator.new(key)

    assert_equal Date.new, offset.date

  end

  def test_reformat_date_returns_date_like_01012017
    key_generator = KeyGenerator.new
    key = key_generator
    offset = OffsetCalculator.new(key)

    date = offset.reformat_date

    assert_equal 10112, date
  end

  def test_square_the_date_method
    key_generator = KeyGenerator.new
    key = key_generator
    offset = OffsetCalculator.new(key)
    offset.reformat_date

    squared_date = offset.squared_date

    assert_equal 102252544, squared_date
  end

  def test_find_last_4_digits
    key_generator = KeyGenerator.new
    key = key_generator
    offset = OffsetCalculator.new(key)
    offset.reformat_date
    offset.squared_date

    expected = 2544
    actual = offset.last_4_digits

    assert_equal expected, actual
  end

  def test_find_offsets
    key_generator = KeyGenerator.new
    key = key_generator
    offset = OffsetCalculator.new(key)
    offset.reformat_date
    offset.squared_date

    






end