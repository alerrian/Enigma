require_relative 'test_helper'
require_relative '../lib/enigma'

class NewClassTest < Minitest::Test
  def setup
    @new_enigma = Enigma.new
  end

  def test_enigma_exists
    assert_instance_of Enigma, @new_enigma
  end

  def test_enigma_can_encrypt
    expected = {
      encryption: 'keder ohulw',
      key: '02715',
      date: '040895'
    }

    assert_equal expected, @new_enigma.encrypt('hello world', '02715', '040895')
  end

  def test_enigma_can_decrypt
    expected = {
      decryption: 'hello world',
      key: '02715',
      date: '040895'
    }

    assert_equal expected, @new_enigma.encrypt('keder ohulw', '02715', '040895')
  end
end
