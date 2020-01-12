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
    key = KeyGen.new(key)
    date = DateGen.new(date)

    keys = key.create_hash(key.generate_key)
    offsets = date.create_hash(date.generate_offset)

    keys.merge(offsets){ |hash_keys, key_val, off_val| key_val + off_val }
  end
end
