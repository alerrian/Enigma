class KeyGen
  attr_reader :key

  def initialize(key = Array.new(5) { rand(10) })
    @key = key
  end

  def split_key
    split = []
    @key.split('').each_cons(2) { |char| split.push(char.join.to_i) }

    split
  end
end
