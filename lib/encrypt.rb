require_relative 'writer'

if ARGV.length < 2
  nil
else
  Writer.encrypt(ARGV[0], ARGV[1])
end
