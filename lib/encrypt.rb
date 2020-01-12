require_relative 'enigma'

new_enigma = Enigma.new

handle = File.open(ARGV[0], "r")

incoming_txt = handle.read

handle.close

encrypted_string = new_enigma.encrypt(incoming_txt, *ARGV[2..3])

writer = File.open(ARGV[1], "w")

writer.write(encrypted_string[:encryption])

writer.close

p "Created #{ARGV[1]} with the key #{encrypted_string[:key]} and date #{encrypted_string[:date]}"