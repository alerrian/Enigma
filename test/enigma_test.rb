require_relative 'test_helper'
require_relative '../lib/enigma'

class EnigmaTest < Minitest::Test
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
    skip
    expected = {
      decryption: 'hello world',
      key: '02715',
      date: '040895'
    }

    assert_equal expected, @new_enigma.decrypt('keder ohulw', '02715', '040895')
  end

  def test_enigma_can_generate_shift
    shift_hash = {"A"=>3, "B"=>27, "C"=>73, "D"=>20}

    assert_equal shift_hash, @new_enigma.create_shift('02715', '040895')
  end
end
