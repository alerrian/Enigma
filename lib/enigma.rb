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
      encryption: shift_letters(split_message(message), create_shift(key, date)),
      key: key,
      date: date
    }
  end

  def decrypt(message, key, date)
    # logic
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

  def shift_letters(broken_chars, shifts)
    encry_message = []
    broken_chars.each do |char_group|
      char_group.each_with_index do |char, index|
        if @ALPHABET.include?(char)
          encry_message.push(@ALPHABET.rotate(shifts[index])[@ALPHABET.find_index(char)])
        else
          encry_message.push(char)
        end
      end
    end
    encry_message.join
  end
end
