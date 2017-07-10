require './lib/key_generator'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class KeyGeneratorTest <Minitest::Test
  def test_key_generator_class_exists
    key_generator = KeyGenerator.new

    assert_instance_of KeyGenerator, key_generator
  end

  def test_key_generator_for_refute
    key_generator = KeyGenerator.new


    
  end

  def test_a_rotation_equal_first_two_key_indexes
    key_generator = KeyGenerator.new
    key = key_generator.key
    a = key_generator.a

    assert_equal key[0..1].join('').to_i, a
  end

  def test_b_rotation_equals_second_two_key_indexes
    key_generator = KeyGenerator.new
    key = key_generator.key
    b = key_generator.b

    assert_equal key[1..2].join('').to_i, b
  end

  def test_c_rotation_equals_second_two_key_indexes
    key_generator = KeyGenerator.new
    key = key_generator.key
    c = key_generator.c

    assert_equal key[2..3].join('').to_i, c
  end

  def test_d_rotation_equals_second_two_key_indexes
    key_generator = KeyGenerator.new
    key = key_generator.key
    d = key_generator.d

    assert_equal key[3..4].join('').to_i, d
  end








end
