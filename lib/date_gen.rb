require_relative './modules/createable'

class DateGen
  include Createable

  attr_reader :date

  def initialize(date = DateTime.now.strftime('%d%m%y'))
    @date = date
  end

  def square_date
    @date.to_i ** 2
  end

  def generate_offset
    square_date.digits.reverse.last(4)
  end
end
