def substrings(string, dictionary)
  substring_count = Hash.new
  string = string.downcase

  dictionary.each do |word|

    repetitions = string.split(word).length - 1
    substring_count[word] = repetitions if repetitions > 0
  
  end

  return substring_count

end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

puts substrings("Howdy partner, sit down! How's it going?", dictionary)
