require_relative 'encryptor'
require_relative 'decryptor'
require 'date'
class Enigma

  attr_reader :encryptor, :decryptor

  def initialize
    @today = Date.today.strftime('%d%m%y')
    @autokey = '%05d' % rand(10**5)
  end

  def encrypt(message, key = @autokey, date = @today)
    Encryptor.new(message, key, date).encrypt
  end

  def decrypt(cipher, key, date = @today)
    Decryptor.new(cipher, key, date).decrypt
  end
end
