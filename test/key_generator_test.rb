require './lib/key_generator'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class KeyGeneratorTest <Minitest::Test
  def test_key_generator_class_exists
    key_generator = KeyGenerator.new

    assert_instance_of KeyGenerator, key_generator
  end

  def test_a_rotation_equal_first_two_key_indexes
    key_generator = KeyGenerator.new
    key = key_generator.key
    a = key_generator.a

    assert_equal key[0..1], a
  end

  def test_b_rotation_eqauls_second_two_key_indexes
    key_generator = KeyGenerator.new
    key = key_generator.key
    b = key_generator.b

    assert_equal key[1..2], b
  end

  def test_c_rotation_eqauls_second_two_key_indexes
    key_generator = KeyGenerator.new
    key = key_generator.key
    c = key_generator.c

    assert_equal key[2..3], c
  end

  def test_d_rotation_eqauls_second_two_key_indexes
    key_generator = KeyGenerator.new
    key = key_generator.key
    c = key_generator.c

    assert_equal key[2..3], d
  end




  # def test_key_generator_starts_by_creating_random_5_digit_number
  #   key_generator= KeyGenerator.new
  #
  #   expected =
  #   actual = key_generator.key
  #
  #   assert_equal expected, actual
  # end




end
