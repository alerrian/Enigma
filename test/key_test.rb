require_relative 'test_helper'
require_relative '../lib/key_gen'

class KeyGenTest < Minitest::Test
  def setup
    @key_gen = KeyGen.new
  end

  def test_a_key_generator_exists
    assert_instance_of KeyGen, @key_gen
  end

  def test_default_keys_are_random_integers
    # test default key
    @key_gen.key.each_char do |key_char|
      assert_includes (0..9), key_char.to_i
    end

    # test input keys
    new_key = KeyGen.new('02715')

    assert_equal '02715', new_key.key
  end

  def test_keys_are_generated
    expected = [2, 27, 71, 15]

    new_key = KeyGen.new('02715')
    assert_equal expected, new_key.generate_key
  end

  def test_key_can_make_key_hash
    expected = {
      "A"=>2,
      "B"=>27,
      "C"=>71,
      "D"=>15
    }

    assert_equal expected, @key_gen.create_hash([2, 27, 71, 15])
  end
end
