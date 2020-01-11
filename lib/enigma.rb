require_relative 'key_gen'
require_relative 'date_gen'

class Enigma
  attr_reader :rand_key

  def initialize
    @rand_key = KeyGen.new
    @today = DateGen.new
  end

  def encrypt(message, key = @rand_key.key.to_s, date = @today)
    in_key = KeyGen.new(key)
    in_date = DateGen.new(date)

    {
      encryption: message,
      key: in_key.key,
      date: in_date.date
    }
  end

  def decrypt(message, key, date)
    # logic
  end
end
