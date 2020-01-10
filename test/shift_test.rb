require_relative 'test_helper'
require_relative '../lib/shift'

class ShiftTest < Minitest::Test
  def setup
    @shift = Shift.new
  end

  def test_shift_exists
    assert_instance_of Shift, @shift
  end
end
