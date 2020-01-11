require_relative 'key_gen'
require_relative 'date_gen'
require_relative 'shift'

class Enigma
  attr_reader :rand_key

  def initialize
    @rand_key = KeyGen.new
    @today = DateGen.new
  end

  def encrypt(message, key = @rand_key.key.to_s, date = @today)
    shift = Shift.new(key, date)
    {
      encryption: message,
      key: shift.key.key,
      date: date
    }
  end

  def decrypt(message, key, date)
    # logic
  end
end
