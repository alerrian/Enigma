require_relative '../lib/key_gen'
# require_relative '../lib/date_gen'

class Enigma
  def encrypt(message, key, date)
    gen_key = KeyGen.new(key)
    gen_key.split_key
    # gen_date = DateGen.new(date)

    require 'pry'; binding.pry
  end

  def decrypt(message, key, date)
    # logic
  end
end
