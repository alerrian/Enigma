require_relative 'test_helper'
require_relative '../lib/date_gen'

class DateTest < Minitest::Test
  def setup
    @date_gen = DateGen.new
  end

  def test_a_key_generator_exists
    assert_instance_of DateGen, @date_gen
  end
end
