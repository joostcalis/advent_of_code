def count_valid_passphrases_with_anagram(passphrase_array)
  passphrase_array.select{ |passphrase| valid_passphrase_with_anagram?(passphrase) }.count
end

def valid_passphrase_with_anagram?(passphrase)
  passphrase.map!{ |word| word.chars.sort.join }
  passphrase.count == passphrase.uniq.count
end
