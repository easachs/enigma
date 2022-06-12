require_relative 'writer'

if ARGV.length < 3
  nil
else
  Writer.crack(ARGV[0], ARGV[1], ARGV[2])
end
