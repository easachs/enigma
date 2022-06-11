require_relative 'enigma'

unencrypted_src = File.join('.', 'msgs', 'unencrypted', ARGV[0])
unencrypted = File.open(unencrypted_src, 'r')
message = unencrypted.read
unencrypted.close

enigma = Enigma.new
encrypted = enigma.encrypt(message)

writer_src = File.join('.', 'msgs', 'encrypted', ARGV[1])
writer = File.open(writer_src, 'w')
writer.write(encrypted[:encryption])
writer.close

puts "Created '#{ARGV[1]}' with the key #{encrypted[:key]} and date #{encrypted[:date]}"
