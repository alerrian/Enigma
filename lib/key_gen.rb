require_relative './modules/createable'

class KeyGen
  include Createable

  attr_reader :key

  def initialize(key = Array.new(5) { rand(10) }.join)
    @key = key
  end

  def generate_key
    split = []
    @key.split('').each_cons(2) { |char| split.push(char.join.to_i) }

    split
  end
end
