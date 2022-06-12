require_relative 'writer'

if ARGV.length < 4
  nil
else
  Writer.decrypt(ARGV[0], ARGV[1], ARGV[2], ARGV[3])
end
# 38901, 110622
