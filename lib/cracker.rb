require_relative 'codable'
class Cracker
  include Codable

  def initialize(message, date)
    @message = message
    @date = date
  end

  def crack
    placeholder = "placeholder"
    { decryption: solution, date: @date, key: placeholder }
  end

  def message_four
    @message.downcase.chars[-4..-1].reverse
  end

  def indexed_four
    message_four.map { |letter| char_to_index(letter).last }
  end

  def message_array
    @message.downcase.chars.reverse.each_slice(4).to_a
  end

  def shifts_array
    shift_array = []
    shift_array << (indexed_four[0] - 3) % 27
    shift_array << (indexed_four[1] - 13) % 27
    shift_array << (indexed_four[2] - 4) % 27
    shift_array << (indexed_four[3] - 26) % 27
    shift_array
  end

  def letters_array
    shifted_array.map do |chunk|
      chunk.map { |number| num_to_index(number).first }.reverse
    end.reverse
  end

  def date_offset
    (@date.to_i**2).to_s[-4..-1].chars.map(&:to_i)
  end
end
