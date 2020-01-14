require_relative 'key_gen'
require_relative 'date_gen'

class Enigma
  attr_reader :rand_key, :today, :ALPHABET

  def initialize
    @ALPHABET = ('a'..'z').to_a.push(' ')
    @rand_key = KeyGen.new
    @today = DateGen.new
  end

  def encrypt(message, key = @rand_key.key.to_s, date = @today.date.to_s)
    {
      encryption: encrypt_letters(split_message(message), shift(key, date)),
      key: key,
      date: date
    }
  end

  def decrypt(message, key = @rand_key.key.to_s, date = @today.date.to_s)
    {
      decryption: decrypt_letters(split_message(message), shift(key, date)),
      key: key,
      date: date
    }
  end

  def crack(message, date = @today.date.to_s)
    key = '00000'
    cracked_message = message

    until decrypt(message, key, date)[:decryption][-4..-1] == ' end'
      key = (key.to_i + 1).to_s.rjust(5, '0')
      cracked_message = decrypt(message, key, date)[:decryption]
    end

    { decryption: cracked_message, date: date, key: key }
  end

  def shift(key, date)
    key = KeyGen.new(key)
    date = DateGen.new(date)

    keys = key.create_hash(key.generate_key)
    offsets = date.create_hash(date.generate_offset)

    keys.merge(offsets) { |_keys, key_val, off_val| (key_val + off_val) }.values
  end

  def split_message(message)
    group_chars = []

    message.downcase.chars.each_slice(4) do |char_group|
      group_chars.push(char_group)
    end

    group_chars
  end

  def encrypt_letters(chars, shifts)
    encry_message = []
    chars.each do |char_group|
      char_group.each_with_index do |char, index|
        if in_alphabet?(char)
          encry_message.push(rotate_char(char, shifts[index]))
        else
          encry_message.push(char)
        end
      end
    end
    encry_message.join
  end

  def decrypt_letters(chars, shifts)
    decry_message = []
    chars.each do |char_group|
      char_group.each_with_index do |char, index|
        if in_alphabet?(char)
          decry_message.push(rotate_char(char, -shifts[index]))
        else
          decry_message.push(char)
        end
      end
    end
    decry_message.join
  end

  def in_alphabet?(char)
    @ALPHABET.include?(char)
  end

  def rotate_char(char, amount)
    @ALPHABET.rotate(amount)[@ALPHABET.find_index(char)]
  end
end
