class KeyGen
  attr_reader :keys

  def initialize
    @keys = Array.new(5) { rand(10) }
  end
end
