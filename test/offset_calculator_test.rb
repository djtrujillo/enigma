require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset_calculator'
require './lib/key_generator'
require 'date'

class OffsetCalculatorTest < Minitest::Test
  def test_offset_calculator_exists
    offset = OffsetCalculator.new

    assert_instance_of OffsetCalculator, offset
  end

  def test_offset_calculator_initializes_with_key_generator_instance
    key_generator = KeyGenerator.new
    key = key_generator
    offset = OffsetCalculator.new(key)


    assert_instance_of KeyGenerator, offset.key
  end

  def test_reformat_date_returns_date_like_010117
    key_generator = KeyGenerator.new
    key = key_generator
    offset = OffsetCalculator.new(key, Date.new(2017, 07, 10))

    date = offset.reformat_date

    assert_equal 100717, date
  end

  def test_reformat_date_with_different_date_with_different_date
    key_generator = KeyGenerator.new
    key = key_generator
    offset = OffsetCalculator.new(key, Date.new(2017, 07, 25))

    date = offset.reformat_date

    assert_equal 250717, date
  end

  def test_square_a_different_date
    key_generator = KeyGenerator.new("12345")
    key = key_generator
    offset = OffsetCalculator.new(key, Date.new(2017, 07, 25))
    offset.reformat_date

    squared_date = offset.squared_date

    assert_equal 62859014089, squared_date
  end


  def test_square_the_date_method
    key_generator = KeyGenerator.new("12345")
    key = key_generator
    offset = OffsetCalculator.new(key, Date.new(2017, 07, 10))
    offset.reformat_date

    squared_date = offset.squared_date

    assert_equal 10143914089, squared_date
  end

  def test_different_last_4_digits
    key_generator = KeyGenerator.new("12345")
    offset = OffsetCalculator.new(key_generator, Date.new(2017, 07, 10))
    offset.reformat_date
    offset.squared_date
    expected = "4089"
    actual = offset.last_4_digits

    assert_equal expected, actual
  end

  def

  def test_find_last_4_digits
    key_generator = KeyGenerator.new
    key = key_generator
    offset = OffsetCalculator.new(key)

    expected = '4089'
    actual = offset.last_4_digits

    assert_equal expected, actual
  end

  def test_find_offsets
    key_generator = KeyGenerator.new
    key = key_generator
    offset = OffsetCalculator.new(key)

    assert_equal 4, offset.find_offsets[0]
    assert_equal 0, offset.find_offsets[1]
    assert_equal 8, offset.find_offsets[2]
    assert_equal 9, offset.find_offsets[3]
  end

  def test_final_rotation_numbers
    key_generator = KeyGenerator.new("12345")
    key = key_generator
    offset = OffsetCalculator.new(key)

    assert_equal (12 + 4), offset.a_rotation
    assert_equal (23 + 0), offset.b_rotation
    assert_equal (34 + 8), offset.c_rotation
    assert_equal (45 + 9), offset.d_rotation
  end

end
