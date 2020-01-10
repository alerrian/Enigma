require_relative '../lib/key_gen'
require_relative '../lib/date_gen'

class Enigma
  attr_reader :rand_key

  def initialize
    @rand_key = KeyGen.new
  end

  def encrypt(message, key=@rand_key.generate_key, date)
    require 'pry'; binding.pry
  end

  def decrypt(message, key, date)
    # logic
  end
end
