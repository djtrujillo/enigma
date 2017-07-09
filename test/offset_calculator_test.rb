require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset_calculator'
require './lib/key_generator'

class OffsetCalculatorTest < minitest::Test
  def test_offset_calculator_exists
    offset = OffsetCalculator.new

    assert_instance_of OffsetCalculator, offset
  end
end
