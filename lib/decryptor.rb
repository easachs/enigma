require_relative 'cipher'
class Decryptor < Cipher

  def decrypt
    { decryption: solution, key: @key, date: @date }
  end
end
