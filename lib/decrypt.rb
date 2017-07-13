require './lib/enigma'
require './lib/offset_calculator'
require './lib/key_generator'
# require './lib/encrypt'
# require './data/encrypted'
# require './data/decrypted'
# require './data/message'


encrypted = ARGV[0]
decrypted = ARGV[1]
key = ARGV[2]
date = ARGV[3]

encrypted_message = File.open(encrypted)
text = encrypted_message.read

e = Enigma.new
File.open(decrypted, "w") do |line|
  line.puts e.decrypt(text, key)
end
