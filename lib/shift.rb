require_relative 'key_gen'

class Shift
  attr_reader :key

  def initialize(key, date)
    @key = KeyGen.new(key).key
    # @date = DateGen.new(date)
  end
end
