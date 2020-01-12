require_relative 'key_gen'
require_relative 'date_gen'

class Enigma
  attr_reader :rand_key

  def initialize
    @rand_key = KeyGen.new
    @today = DateGen.new
  end

  def encrypt(message, key = @rand_key.key.to_s, date = @today)
    create_shift(key, date)
    
    {
      encryption: message,
      key: key,
      date: date
    }
  end

  def decrypt(message, key, date)
    # logic
  end

  def create_shift(key, date)
    in_key = KeyGen.new(key)
    in_date = DateGen.new(date)

    keys = in_key.create_hash(in_key.generate_key)
    offsets = in_date.create_hash(in_date.generate_offset)

    keys.merge(offsets){ |hash_keys, key_val, off_val| key_val + off_val }
  end
end
