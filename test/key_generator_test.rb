require './lib/key_generator'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'

class KeyGeneratorTest <Minitest::Test
  def test_key_generator_starts_by_creating_random_5_digit_number
    key_generator= KeyGenerator.new

    expected =
    actual = key_generator.key

    assert_equal expected, actual
  end


end
