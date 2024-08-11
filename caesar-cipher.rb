def caesar_cipher(string, shift)
  number_to_alphabet = Hash[(0..25).zip(('a'..'z'))]
  alphabet_to_number = Hash[('a'..'z').zip((0..25))]

  new_string = string.split("").map do
    |letter|
    if !letter.match?(/[A-Za-z]/)
      letter
    elsif letter == letter.upcase
      number_to_alphabet[(alphabet_to_number[letter.downcase] + shift) % 26].upcase
    else
      number_to_alphabet[(alphabet_to_number[letter] + shift) % 26]
    end
  end
  
  return new_string.join("")
end


puts caesar_cipher("What a string!", 5)
