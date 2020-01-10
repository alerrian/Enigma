require_relative 'test_helper'
require_relative '../lib/enigma'

class NewClassTest < Minitest::Test
  def setup
    @new_enigma = Enigma.new
  end

  def test_enigma_exists
    assert_instance_of Enigma, @new_enigma
  end
end
