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
    key = KeyGenerator.new("11111")
    offset_calculator = OffsetCalculator.new(key)
    e = Enigma.new(offset_calculator)
    message = "he"

    actual = e.encrypt(message)

    assert_equal actual, "wp"
  end

  def test_encrypt_message_with_differet_key
    key = KeyGenerator.new("12345")
    offset_calculator = OffsetCalculator.new(key, Date.new(2017,7,10))
    e = Enigma.new(offset_calculator)
    message = "he"

    actual = e.encrypt(message)

    assert_equal actual, "x1"
  end

  def test_decrypt_message
    key = KeyGenerator.new("11111")
    offset_calculator = OffsetCalculator.new(key)
    e = Enigma.new(offset_calculator)
    message = "wp"

    actual = e.decrypt(message)

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
    key = KeyGenerator.new("32345")
    offset_calculator = OffsetCalculator.new(key, Date.new(2017,7,10))
    e = Enigma.new(offset_calculator)
    message = "hello world"

    output = e.encrypt(message)
    actual = e.decrypt(output)

    assert_equal message, actual
  end

  def test_encrypt_method_displays_encrypted_message
    e = Enigma.new
    my_message = "this is so secret ..end.."
    output = e.encrypt(my_message)
    # puts output

    assert_equal my_message.length, output.length
  end

  def test_encrypt_method_can_take_key_and_date
    e = Enigma.new
    my_message = "this is so secret ..end.."

    output = e.encrypt(my_message, "12345", Date.today)
    expected = "94l7n5vm8.a7uzut9ubnu gno"

    assert_equal expected, output
  end

  def test_encrypt_method_can_output_with_different_date
    e = Enigma.new
    my_message = "this is so secret ..end.."
    output = e.encrypt(my_message, "12345", Date.new(2018,7,10))
    expected = " 9f2o ph9d72v4oo z8ivcaip"

    assert_equal expected, output
  end

  def test_encrypt_method_takes_a_different_key_and_date
    e = Enigma.new
    my_message = "this is so secret ..end.."
    output = e.encrypt(my_message, "12345", Date.new(2003,7,22))

    expected = "96d7n7nm8a57u1mt9w6nu,.no"
    assert_equal expected, output
  end

  def test_decrypt_accepts_key_and_date
    e = Enigma.new
    my_message = "this is so secret ..end.."

    output = e.encrypt(my_message, "12345", Date.today)
    actual = e.decrypt(output, "12345", Date.today)

    assert_equal my_message, actual
  end

  def test_decrypt_returns_a_different_value_with_different_key_or_date
    e = Enigma.new
    my_message = "this is so secret ..end.."

    output = e.encrypt(my_message, "12345", Date.today)
    actual = e.decrypt(output, "23423", Date.today)

    refute_equal my_message, actual
  end

  def test_decrypt_can_not_accept_date
    e = Enigma.new
    my_message = "this is so secret ..end.."
    output = e.encrypt(my_message, "12345")
    actual = e.decrypt(output, "12345")

    assert_equal my_message, actual
  end


  #########################################
  #Crack Tests

  def test_crack
    e = Enigma.new
    my_message = "this is so secret ..end.."
    output = e.encrypt(my_message, "12345")
    actual = e.crack(output, Date.today)

    assert_equal my_message, actual
  end

  def test_crack_a_different_message
    e = Enigma.new
    my_message = "this is a different message ..end.."
    output = e.encrypt(my_message, "12345")
    actual = e.crack(output, Date.today)

    assert_equal my_message, actual
  end

  def test_crack_a_third_message
    e = Enigma.new
    my_message = "this is a completely different message ..end.."
    output = e.encrypt(my_message, "12345")
    actual = e.crack(output, Date.today)

    assert_equal my_message, actual
  end

  def test_find_last_4_elements
    e = Enigma.new
    my_message = "this is so secret ..end.."
    output = e.encrypt(my_message, "12345")

    actual =  e.find_last_four_elements(output)
    expected = [" ","g","n","o"]

    assert_equal expected, actual
  end

  def test_find_offsets_based_on_date
    e = Enigma.new
    date = Date.new(2017,7,10)

    expected = [4,0,8,9]
    actual = e.find_offsets(date)

    assert_equal expected, actual
  end

  def test_find_different_offsets_based_on_different_date
    e = Enigma.new
    date = Date.new(2003,7,10)

    expected = [4,2,0,9]
    actual = e.find_offsets(date)

    assert_equal expected, actual
  end

  def test_find_offset_rotation
    e = Enigma.new
    my_message = "this is so secret ..end.."
    output = e.encrypt(my_message, "12345")
    offset_array = [4,2,0,9]

    expected = [2,0,9,4]
    actual = e.find_offset_rotation(output,offset_array)

    assert_equal expected, actual
  end
end
