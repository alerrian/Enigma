require_relative 'key_gen'

class Shift
  attr_reader :key

  def initialize(key, date)
    @key = KeyGen.new(key)
    @date = DateGen.new(date).date
  end
end
