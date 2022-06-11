require_relative 'codable'
class Cipher
  include Codable

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
  end
end
