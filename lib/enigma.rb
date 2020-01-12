require_relative 'key_gen'
require_relative 'date_gen'

class Enigma
  attr_reader :rand_key, :today, :ALPHABET

  def initialize
    @ALPHABET = ('a'..'z').to_a.push(' ')
    @rand_key = KeyGen.new
    @today = DateGen.new
  end

  def encrypt(message, key = @rand_key.key.to_s, date = @today)    
    {
      encryption: shift_letters(split_message(message), create_shift(key, date), 'e'),
      key: key,
      date: date
    }
  end

  def decrypt(message, key = @rand_key.key.to_s, date = @today)
    {
      decryption: shift_letters(split_message(message), create_shift(key, date), 'd'),
      key: key,
      date: date
    }
  end

  def create_shift(key, date)
    key = KeyGen.new(key)
    date = DateGen.new(date)

    keys = key.create_hash(key.generate_key)
    offsets = date.create_hash(date.generate_offset)

    keys.merge(offsets) { |_keys, key_val, off_val| (key_val + off_val) }.values
  end

  def split_message(message)
    broken_chars = []

    message.downcase.chars.each_slice(4) { |char_group| broken_chars.push(char_group) }

    broken_chars
  end

  def shift_letters(broken_chars, shifts, e_d_flag)
    encry_message = []
    broken_chars.each do |char_group|
      char_group.each_with_index do |char, index|
        if e_d_flag == 'e'
          if in_alphabet?(char)
            encry_message.push(rotate_char(char, shifts[index]))
          else
            encry_message.push(char)
          end
        elsif e_d_flag == 'd'
          if in_alphabet?(char)
            encry_message.push(rotate_char(char, -shifts[index]))
          else
            encry_message.push(char)
          end
        end
      end
    end
    encry_message.join
  end

  def in_alphabet?(char)
    @ALPHABET.include?(char)
  end

  def rotate_char(char, amount)
    @ALPHABET.rotate(amount)[@ALPHABET.find_index(char)]
  end
end
