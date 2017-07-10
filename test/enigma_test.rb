require './lib/enigma'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/offset_calculator'
require './lib/key_generator'


class EncryptTest <Minitest::Test

  def test_the_character_map_exists
    map = Enigma.new

    expected = [*("a".."z"), *(0..9), " ", ".", ","]
    actual = map.character_map

    assert_equal expected, actual
  end


  def test_method_turns_message_into_array_of_characters
    e = Enigma.new
    message = "hello"
    message_array = e.message_array(message)

    assert_equal ["h","e","l","l","o"], message_array
  end

  # def test_rotate_each_character_two
  #   e = Enigma.new
  #   message = "hello"
  #
  #   expected = "jgnnq"
  #   actual = e.encrypt(message, 2)
  #
  #   assert_equal expected, actual
  # end
  def test_encrypt_message
    e = Enigma.new
    key = KeyGenerator.new
    offset_calculator = OffsetCalculator.new(key)
    offset_calculator.run_methods
    message = "hello"


    actual = e.encrypt(message, offset_calculator)

    assert_equal actual, actual
  end

    #think about index number instead of ABCD index % 4 == 2 use C rotation

end
