module Codable
  def char_index
    (('a'..'z').to_a << ' ').each_with_index.to_a
  end

  def special_char(character)
    !char_index.flatten.include?(character)
  end

  def char_to_index(character)
    if special_char(character)
      character.chars
    else
      char_index.find { |char| char.first == character }
    end
  end

  def num_to_index(number)
    if special_char(number)
      [].push(number)
    else
      char_index.find { |num| num.last == number }
    end
  end

  def message_array
    @message.downcase.chars.each_slice(4).to_a
  end

  def indexed_array
    message_array.map do |chunk|
      chunk.map { |letter| char_to_index(letter).last }
    end
  end

  def shifts_array
    shift_array = []
    offsets = (@date.to_i**2).to_s[-4..-1]
    index = 0
    while index < 4
      shift_array << @key[index, 2].to_i + offsets[index].to_i
      index += 1
    end
    shift_array
  end

  def letters_array
    shifted_array.map do |chunk|
      chunk.map { |number| num_to_index(number).first }
    end
  end

  def solution
    letters_array.join
  end
end
