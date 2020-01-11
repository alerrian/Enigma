class DateGen
  attr_reader :date
  
  def initialize(date = DateTime.now.strftime('%d%m%y'))
    @date = date
  end
end
