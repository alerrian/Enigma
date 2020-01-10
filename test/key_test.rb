require_relative 'test_helper'
require_relative '../lib/key_gen'

class KeyGenTest < Minitest::Test
  def setup
    @key_gen = KeyGen.new
  end

  def test_a_key_generator_exists
    assert_instance_of KeyGen, @key_gen
  end
end
