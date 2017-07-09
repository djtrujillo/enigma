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




end
