class Encryptor
  def cipher(rotation)
    characters = (" ".."z").to_a
    rotated_characters = characters.rotate(rotation)
    Hash[characters.zip(rotated_characters)]
  end

  def encrypt_letter(letter, rotation)
    cipher_for_rotation = cipher(rotation)
    cipher_for_rotation[letter]
  end

  def encrypt(string, rotation)
  letters = string.split("")
  results = letters.collect do |letter|
    encrypt_letter(letter, rotation)
    end
    return results.join
  end

  def decrypt_letter(letter, rotation)
    cipher_for_rotation = cipher(-rotation)
    cipher_for_rotation[letter]
  end

  def decrypt(string, rotation)
    letters = string.split("")
    results = letters.collect do |letter|
      decrypt_letter(letter, rotation)
      end
      return results.join
  end

  def encrypt_file(filename, rotation)
    # Create the file handle to input the file
    input = File.open(filename, "r")
    # Read the text of the input file
    input_file = input.read
    # Encrypt the text
    text = encrypt(input_file, rotation)
    # Create a name for the output file
    file_encrypted = "#{filename}.encrypted"
    # Create an output file handle
    output = File.open(file_encrypted, "w")
    # Write out the text
    output.write(text)
    # Close the file
    output.close
  end

  def decrypt_file(filename, rotation)
    # Create the file handle to encrypted file
    input = File.open(filename, "rb")
    # Read the encrypted text
    input_file = input.read
    # Decrypt the text by passing in the test and rotation
    text = decrypt(input_file, rotation)
    # Create a name for the decrypted file
    output_filename = filename.gsub("encrypted", "decrypted")
    # Create an output file handle
    output = File.open(output_filename, "w")
    # Write out the text
    output.write(text)
    # Close the file
    output.close
  end

  def supported_characters
    (' '..'z').to_a
  end

  def crack(message)
    supported_characters.count.times.collect do |attempt|
    decrypt(message, attempt)
    end
  end
end
