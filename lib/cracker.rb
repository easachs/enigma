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

  def message_four_bw
    @message.downcase.chars[-4..-1].reverse
  end

  def indexed_four_bw
    message_four_bw.map { |letter| char_to_index(letter).last }
  end

  def message_array
    @message.downcase.chars.reverse.each_slice(4).to_a
  end

  def shifts_array_bw
    shift_array = []
    shift_array << (indexed_four_bw[0] - 3) % 27
    shift_array << (indexed_four_bw[1] - 13) % 27
    shift_array << (indexed_four_bw[2] - 4) % 27
    shift_array << (indexed_four_bw[3] - 26) % 27
    shift_array
  end

  def shifted_array
    new_array = []
    indexed_array.each do |chunk|
      new_chunk = []; index = 0
      while index < 4
        if special_char(chunk[index])
          new_chunk << chunk[index] unless chunk[index].nil?
        else
          new_chunk << (chunk[index] - shifts_array_bw[index]) % 27
        end
        index += 1
      end
      new_array << new_chunk
    end
    new_array
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
