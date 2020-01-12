require_relative 'enigma'

new_enigma = Enigma.new

handle = File.open(ARGV[0], "r")

incoming_txt = handle.read.chomp

handle.close

decrypted_string = new_enigma.decrypt(incoming_txt, ARGV[2], ARGV[3])

writer = File.open(ARGV[1], "w")

writer.write(decrypted_string[:decryption])

writer.close

p "Created #{ARGV[1]} with the key #{decrypted_string[:key]} and date #{decrypted_string[:date]}"