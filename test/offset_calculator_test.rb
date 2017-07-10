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

  def test_reformat_date_returns_date_like_01012017
    key_generator = KeyGenerator.new
    key = key_generator
    offset = OffsetCalculator.new(key)

    date = offset.reformat_date

    assert_equal 70117, date
  end

  def test_square_the_date_method
    key_generator = KeyGenerator.new
    key = key_generator
    offset = OffsetCalculator.new(key)
    offset.reformat_date

    squared_date = offset.squared_date

    assert_equal 4916393689, squared_date
  end

  def test_find_last_4_digits
    key_generator = KeyGenerator.new
    key = key_generator
    offset = OffsetCalculator.new(key)
    offset.run_methods

    expected = '3689'
    actual = offset.last_4_digits

    assert_equal expected, actual
  end

  def test_find_offsets
    key_generator = KeyGenerator.new
    key = key_generator
    offset = OffsetCalculator.new(key)
    offset.run_methods

    assert_equal 3, offset.find_offsets[0]
    assert_equal 6, offset.find_offsets[1]
    assert_equal 8, offset.find_offsets[2]
    assert_equal 9, offset.find_offsets[3]
  end

  def test_final_rotation_numbers
    key_generator = KeyGenerator.new
    key = key_generator
    offset = OffsetCalculator.new(key)
    offset.run_methods

    assert_equal (offset.key.a + 3), offset.a_rotation
    assert_equal (offset.key.b + 6), offset.b_rotation
    assert_equal (offset.key.c + 8), offset.c_rotation
    assert_equal (offset.key.d + 9), offset.d_rotation
  end


end
