def count_valid_passphrases(passphrase_array)
  passphrase_array.select{ |passphrase| valid_passphrase?(passphrase) }.count
end

def valid_passphrase?(passphrase)
  passphrase.count == passphrase.uniq.count
end
