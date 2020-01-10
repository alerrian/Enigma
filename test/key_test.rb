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
    @key_gen.key.each do |key|
      assert_includes (0..9), key
    end
  end
end
