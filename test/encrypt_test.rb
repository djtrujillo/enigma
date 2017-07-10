require './lib/encrypt'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class EncryptTest <Minitest::Test

  def test_the_character_map_exists
    map = Enigma.new

    expected = [("a".."z"), (1..9), " ", ".", ","]
    actual = map.character_map

    assert_equal expected, actual
  end

  def test_method_turns_message_into_array_of_characters
    e = Enigma.new
    message = "hello"
    message_array = e.message_array(message)

    assert_equal ["h","e","l","l","o"], message_array
  end

  def test_create_hash_with_abcd
    e = Enigma.new
    message = "hello"
    message_hash = e.message_hash(message)

    assert_equal {"h"=> "A", "e" => "B" "l" => "C", "l" => "D", "o" => "A"}, message_hash
  end


  end




end
