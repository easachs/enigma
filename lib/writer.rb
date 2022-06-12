require_relative 'enigma'
class Writer
  def initialize
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

  def self.crack(from, to, date)
    enigma = Enigma.new
    encrypted = File.open(File.join('.', 'msgs', 'encrypted', from), 'r')
    cipher = encrypted.read.chop
    encrypted.close
    unencrypted = enigma.crack(cipher, date)
    writer = File.open(File.join('.', 'msgs', 'unencrypted', to), 'w')
    writer.write(unencrypted[:decryption])
    writer.close
    puts "Created '#{to}' with the key #{unencrypted[:key]} and date #{unencrypted[:date]}"
  end
end
