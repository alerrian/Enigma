require_relative 'test_helper'
require_relative '../lib/date_gen'
require 'mocha/minitest'

class DateTest < Minitest::Test
  def setup
    @date_gen = DateGen.new('110120')
  end

  def test_a_key_generator_exists
    assert_instance_of DateGen, @date_gen
  end

  def test_can_use_todays_date
    date = DateGen.new

    date.stubs(date: '110120')

    assert_equal '110120', @date_gen.date
  end

  def test_date_can_be_sent_in
    assert_equal '110120', @date_gen.date
  end

  def test_date_can_be_squared
    assert_equal 12126414400, @date_gen.square_date
  end

  def test_can_retrieve_last_4_from_squared_date
    assert_equal [4, 4, 0, 0], @date_gen.generate_offset
  end
end
