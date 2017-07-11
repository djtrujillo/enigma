require './lib/enigma'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/offset_calculator'
require './lib/key_generator'

class EncryptTest <Minitest::Test

  def test_the_character_map_exists
    map = Enigma.new

    expected = [*("a".."z"), *("0".."9"), " ", ".", ","]
    actual = map.character_map

    assert_equal expected, actual
  end


  def test_method_turns_message_into_array_of_characters
    e = Enigma.new
    message = "hello"
    message_array = e.message_array(message)

    assert_equal ["h","e","l","l","o"], message_array
  end

  def test_encrypt_letter
    e = Enigma.new
    letter = "a"

    expected = "c"
    actual = e.encrypt_letter(letter, 2)

    assert_equal expected, actual
  end

  def test_encrypt_different_letter_with_different_rotation
    e = Enigma.new
    letter = "1"

    expected = " "
    actual = e.encrypt_letter(letter, 9)

    assert_equal expected, actual
  end

  def test_encrypt_message
    e = Enigma.new
    key = KeyGenerator.new([1,1,1,1,1])
    offset_calculator = OffsetCalculator.new(key)
    offset_calculator.run_methods
    message = "he"

    actual = e.encrypt(message, offset_calculator)

    assert_equal actual, "wp"
  end

  def test_encrypt_message_with_differet_key
    e = Enigma.new
    key = KeyGenerator.new([1,2,3,4,5])
    offset_calculator = OffsetCalculator.new(key, Date.new(2017,7,10))
    offset_calculator.run_methods
    message = "he"

    actual = e.encrypt(message, offset_calculator)

    assert_equal actual, "x1"
  end

  def test_decrypt_message
    e = Enigma.new
    key = KeyGenerator.new([1,1,1,1,1])
    offset_calculator = OffsetCalculator.new(key)
    offset_calculator.run_methods
    message = "wp"

    actual = e.decrypt(message, offset_calculator)

    assert_equal actual, "he"
  end

  def test_cipher_method_returns_hash
    e = Enigma.new
    cipher = e.cipher(2)

    expected = true
    actual = cipher.is_a?(Hash)

    assert_equal expected, actual
  end

  def test_encrypt_and_decrypt_hello_world
    e = Enigma.new
    key = KeyGenerator.new([3,2,3,4,5])
    offset_calculator = OffsetCalculator.new(key, Date.new(2017,7,10))
    offset_calculator.run_methods
    message = "hello world"

    output = e.encrypt(message, offset_calculator)
    actual = e.decrypt(output, offset_calculator)

    assert_equal message, actual
  end

  # rotation tests
  # key of 32345
  # date of 7/10/17
  # a = 36
  # b = 23
  # c = 42
  # d = 54

  # rotation tests
  # key of 12345
  # date of 7/10/17
  # a = 16
  # b = 23
  # c = 42
  # d = 54

  # rotation tests
  # key of 11111
  # date 7/10/17
  # a = 15
  # b = 11
  # c = 19
  # d = 20

  # rotation tests
  # key of 22222
  # date 7/10/17
  # a = 26
  # b = 22
  # c = 30
  # d = 31

  # rotation tests
  # key of 12131
  # date 7/10/17
  # a = 16
  # b = 21
  # c = 21
  # d = 40
  #
  # def test_find_rotation_numbers
  #   key = KeyGenerator.new ([3,2,3,4,5])
  #   offset = OffsetCalculator.new(key, Date.new(2017, 07, 10))
  #   offset.run_methods
  #   puts offset.a_rotation.inspect
  #   puts offset.b_rotation.inspect
  #   puts offset.c_rotation.inspect
  #   puts offset.d_rotation.inspect
  # end

end
