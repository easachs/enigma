require 'date'

class Enigma

  attr_reader :characters

  def initialize
    @characters = ('a'..'z').to_a << ' '
    @today = Date.today.strftime('%d%m%y')
    @autokey = '%05d' % rand(10**5)
  end

  def encrypt(message, key = @autokey, date = @today)
    encrypted = "placeholder"
    encrypt_hash = { encryption: encrypted, key: key, date: date }
  end

  def decrypt(cipher, key, date = @today)
    decrypted = "placeholder"
    decrypt_hash = { decryption: decrypted, key: key, date: date }
  end
end

# Keys:
# A key: key[0..1].to_i
# B key: key[1..2].to_i
# C key: key[2..3].to_i
# D key: key[3..4].to_i

# Offsets:
# date_squared = date.to_i ** 2
# last_four = date_squared.to_s[-4..-1]
# A offset: last_four[0].to_i
# B offset: last_four[1].to_i
# C offset: last_four[2].to_i
# D offset: last_four[3].to_i

# Final shifts:
# A/B/C/D: key + offset

# number_to_letter = (1..27).zip(@characters).to_h
