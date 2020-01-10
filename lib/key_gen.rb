class KeyGen
  attr_reader :key

  def initialize(key = Array.new(5) { rand(10) })
    @key = key
  end
end
