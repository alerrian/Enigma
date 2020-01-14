require_relative 'enigma'

new_enigma = Enigma.new

handle = File.open(ARGV[0], "r")

incoming_txt = handle.read.chomp

handle.close

cracked_string = new_enigma.crack(incoming_txt, *ARGV[2..3])

writer = File.open(ARGV[1], "w")

writer.write(cracked_string[:decryption])

writer.close

p "Created '#{ARGV[1]}' with the key #{cracked_string[:key]} and date #{cracked_string[:date]}"