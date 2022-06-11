require_relative 'enigma'

encrypted_src = File.join('.', 'msgs', 'encrypted', ARGV[0])
encrypted = File.open(encrypted_src, 'r')
cipher = encrypted.read
encrypted.close

enigma = Enigma.new
unencrypted = enigma.decrypt(cipher, ARGV[2], ARGV[3])

writer_src = File.join('.', 'msgs', 'unencrypted', ARGV[1])
writer = File.open(writer_src, 'w')
writer.write(unencrypted[:decryption])
writer.close

puts "Created '#{ARGV[1]}' with the key #{unencrypted[:key]} and date #{unencrypted[:date]}"

# 38901, 110622
