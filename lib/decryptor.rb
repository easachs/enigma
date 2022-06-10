class Decryptor

  # attr_reader :characters

  def initialize(cipher, key, date)
    @cipher = cipher.downcase
    @key = key
    @date = date
    # @today = Date.today.strftime('%d%m%y')
    # @autokey = '%05d' % rand(10**5)
    @characters = ('a'..'z').to_a << ' '
  end

  def decrypt
    decrypted = 'placeholder'
    decrypt_hash = { decryption: decrypted, key: @key, date: @date }
  end

  def shifts(key, date)
    shift_array = []
    offsets = (date.to_i ** 2).to_s[-4..-1]
    a_shift = key[0..1].to_i + offsets[0].to_i
    b_shift = key[1..2].to_i + offsets[1].to_i
    c_shift = key[2..3].to_i + offsets[2].to_i
    d_shift = key[3..4].to_i + offsets[3].to_i
    shift_array.push(a_shift, b_shift, c_shift, d_shift)
  end
end
