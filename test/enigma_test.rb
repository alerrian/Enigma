require_relative 'test_helper'
require_relative '../lib/enigma'

class EnigmaTest < Minitest::Test
  def setup
    @new_enigma = Enigma.new
  end

  def test_enigma_exists
    assert_instance_of Enigma, @new_enigma
  end

  def test_enigma_has_an_alphabet
    assert_equal ('a'..'z').to_a.push(' '), @new_enigma.ALPHABET
  end

  def test_enigma_creates_default_keys_and_dates
    assert_instance_of KeyGen, @new_enigma.rand_key
    assert_instance_of DateGen, @new_enigma.today
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

    assert_equal expected, @new_enigma.decrypt('keder ohulw', '02715', '040895')
  end

  def test_enigma_can_crack
    expected = {
      decryption: 'hello world end',
      date: '291018',
      key: '08304'
    }

    assert_equal expected, @new_enigma.crack('vjqtbeaweqihssi', '291018')
  end

  def test_enigma_can_generate_shift
    shift_hash = [3, 27, 73, 20]

    assert_equal shift_hash, @new_enigma.shift('02715', '040895')
  end

  def test_enigma_can_break_messages
    expected = [
      ['h', 'e', 'l', 'l'],
      ['o', ' ', 'w', 'o'],
      ['r', 'l', 'd']
    ]

    assert_equal expected, @new_enigma.split_message('hello world')
  end

  def test_enigma_can_shift_characters
    expected = 'keder ohulw'

    shifts = [3, 27, 73, 20]
    message = [
      ['h', 'e', 'l', 'l'],
      ['o', ' ', 'w', 'o'],
      ['r', 'l', 'd']
    ]

    assert_equal expected, @new_enigma.encrypt_letters(message, shifts)
  end

  def test_enigma_shift_can_encry_other_chars
    expected = 'keder ohulw!'

    shifts = [3, 27, 73, 20]

    message = [
      ['h', 'e', 'l', 'l'],
      ['o', ' ', 'w', 'o'],
      ['r', 'l', 'd', '!']
    ]

    assert_equal expected, @new_enigma.encrypt_letters(message, shifts)
  end

  def test_enigma_can_decry_other_chars
    expected = 'hello world!'

    shifts = [3, 27, 73, 20]

    message = [
      ['k', 'e', 'd', 'e'],
      ['r', ' ', 'o', 'h'],
      ['u', 'l', 'w', '!']
    ]

    assert_equal expected, @new_enigma.decrypt_letters(message, shifts)
  end

  def test_enigma_can_check_if_in_alphabet
    assert_equal true, @new_enigma.in_alphabet?('e')
    assert_equal false, @new_enigma.in_alphabet?(',')
  end

  def test_enigma_can_rotate_char
    assert_equal 'b', @new_enigma.rotate_char('a', 1)
  end
end
