class Enigma
  def initialize(key, date, message)
    @key = Key.new
    @date = Date.new
    @message = message
  end

  def encrypt(message = @message, key = @key, date = @date)
    # logic
  end

  def decrypt(message, key, date)

  end
end
