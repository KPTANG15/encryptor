class Encryptor
  def cipher
  { "a" => "n", "b" => "o", "c" => "p", "d" => "q",
    "e" => "r", "f" => "s", "g" => "t", "h" => "u",
    "i" => "v", "j" => "w", "k" => "x", "l" => "y",
    "m" => "z", "n" => "a", "o" => "b", "p" => "c",
    "q" => "d", "r" => "e", "s" => "f", "t" => "g",
    "u" => "h", "v" => "i", "w" => "j", "x" => "k",
    "y" => "l", "z" => "m" }
  end

  def encrypt_letter(letter)
    cipher[letter.downcase]
  end

  def encrypt(string)
    # 1. Cut the input string into letters
    letters = string.split("")
    # 2. Encrypt those letters one at a time, gathering the results
    results = letters.collect do |letter|
      encrypt_letter(letter)
    end
    # 3. Join the results back together in one string
    return results.join
  end

  def decrypt_letter(letter)
    cipher[letter.downcase]
  end

  def decrypt(string)
    # 1. Cut the input string into letters
    letters = string.split("")
    # 2. Decrypt those letters one at a time, gathering the results
    results = letters.collect do |letter|
      decrypt_letter(letter)
    end
    # 3. Join the results back together in one string
    return results.join
  end
end
