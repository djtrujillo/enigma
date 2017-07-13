require './lib/enigma'
require './lib/offset_calculator'
require './lib/key_generator'
require './lib/decrypt'
# require './data/encrypted'
# require './data/decrypted'
# require './data/message'
puts Dir.chdir './data'

message = ARGV[0]
encrypted = ARGV[1]
key = ARGV[2]
date = ARGV[3]

my_message = File.open(message)
encrypted_message = File.open(encrypted)
text = my_message.read

e = Enigma.new
File.open(encrypted, "w") do |line|
  line.puts e.encrypt(text, key)
end
