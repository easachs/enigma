require_relative 'codable'
class Encryptor
  include Codable

  def initialize(message, key, date)
    @message = message.downcase
    @key = key
    @date = date
    @char_index = (('a'..'z').to_a << ' ').each_with_index.to_a
  end

  def encrypt
    { encryption: solution, key: @key, date: @date }
  end

  def shifted_array
    new_array = []
    indexed_array.each do |chunk|
      new_chunk = []; index = 0
      while index < 4
        if special_char(chunk[index])
          new_chunk << chunk[index] unless chunk[index].nil?
        else
          new_chunk << (chunk[index] + shifts_array[index]) % 27
        end
        index += 1
      end
      new_array << new_chunk
    end
    new_array
  end
end
