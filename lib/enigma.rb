require_relative 'encryptor'
require_relative 'decryptor'
require 'date'
class Enigma

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

  def self.encrypt(from, to)
    enigma = Enigma.new
    unencrypted = File.open(File.join('.', 'msgs', 'unencrypted', from), 'r')
    message = unencrypted.read
    unencrypted.close
    encrypted = enigma.encrypt(message)
    writer = File.open(File.join('.', 'msgs', 'encrypted', to), 'w')
    writer.write(encrypted[:encryption])
    writer.close
    puts "Created '#{to}' with the key #{encrypted[:key]} and date #{encrypted[:date]}"
  end

  def self.decrypt(from, to, key, date)
    enigma = Enigma.new
    encrypted = File.open(File.join('.', 'msgs', 'encrypted', from), 'r')
    cipher = encrypted.read
    encrypted.close
    unencrypted = enigma.decrypt(cipher, key, date)
    writer = File.open(File.join('.', 'msgs', 'unencrypted', to), 'w')
    writer.write(unencrypted[:decryption])
    writer.close
    puts "Created '#{to}' with the key #{unencrypted[:key]} and date #{unencrypted[:date]}"
  end
end
