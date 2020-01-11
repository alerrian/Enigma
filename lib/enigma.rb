require_relative 'key_gen'
require_relative 'date_gen'
require_relative 'shift'

class Enigma
  attr_reader :rand_key

  def initialize
    @rand_key = KeyGen.new
  end

  def encrypt(message, key=generate_key, date)
    shift = Shift.new(key, date)
    {
      encryption: message,
      key: shift.key.generate_key,
      date: shift.date.generate_date
    }
  end

  def decrypt(message, key, date)
    # logic
  end
end
