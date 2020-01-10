require_relative 'test_helper'
require_relative '../lib/shift'

class ShiftTest < Minitest::Test
  def setup
    @shift = Shift.new('02715', '103087')
  end

  def test_shift_exists
    assert_instance_of Shift, @shift
  end

  def test_a_key_is_created_in_shift
    assert_instance_of KeyGen, @shift.key
  end
end
