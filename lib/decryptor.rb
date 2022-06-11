class Decryptor

  def initialize(message, key, date)
    @message = message.downcase
    @key = key
    @date = date
    @char_index = (('a'..'z').to_a << ' ').each_with_index.to_a
  end

  def decrypt
    decrypt_hash = { decryption: decrypted_message, key: @key, date: @date }
  end

  def char_to_index(character)
    @char_index.find { |char| char.first == character }
  end

  def num_to_index(number)
    @char_index.find { |num| num.last == number }
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
    a_shift = @key[0..1].to_i + offsets[0].to_i
    b_shift = @key[1..2].to_i + offsets[1].to_i
    c_shift = @key[2..3].to_i + offsets[2].to_i
    d_shift = @key[3..4].to_i + offsets[3].to_i
    shift_array.push(a_shift, b_shift, c_shift, d_shift)
  end

  def backshifted_array
    new_array = []
    indexed_array.each do |chunk|
      new_chunk = []
      new_chunk << (chunk[0] - shifts_array[0]) % 27 unless chunk[0].nil?
      new_chunk << (chunk[1] - shifts_array[1]) % 27 unless chunk[1].nil?
      new_chunk << (chunk[2] - shifts_array[2]) % 27 unless chunk[2].nil?
      new_chunk << (chunk[3] - shifts_array[3]) % 27 unless chunk[3].nil?
      new_array << new_chunk
    end
    new_array
  end

  def decoded_array
    backshifted_array.map do |chunk|
      chunk.map { |number| num_to_index(number).first }
    end
  end

  def decrypted_message
    decoded_array.join
  end
end
