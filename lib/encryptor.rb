class Encryptor

  def initialize(message, key, date)
    @message = message.downcase
    @key = key
    @date = date
    @char_index = (('a'..'z').to_a << ' ').each_with_index.to_a
  end

  def encrypt
    encrypt_hash = { encryption: encrypted, key: @key, date: @date }
  end

  def special_char(character)
    !@char_index.flatten.include?(character)
  end

  def char_to_index(character)
    if special_char(character)
      character.chars
    else
      @char_index.find { |char| char.first == character }
    end
  end

  def num_to_index(number)
    if special_char(number)
      Array.new.push(number)
    else
      @char_index.find { |num| num.last == number }
    end
  end

  def message_array
    @message.chars.each_slice(4).to_a
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
    while index < 4 do
      shift_array << @key[index, 2].to_i + offsets[index].to_i
      index += 1
    end
    shift_array
  end

  def shifted_array
    new_array = []
    indexed_array.each do |chunk|
      new_chunk = []; index = 0
      while index < 4 do
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

  def coded_array
    shifted_array.map do |chunk|
      chunk.map { |number| num_to_index(number).first }
    end
  end

  def encrypted
    coded_array.join
  end
end
