# Define a method, #hipsterfy, that accepts a sentence (string) as an argument.
# The method should return a new string with the last vowel removed from each word.

# 'y' is not a vowel. If a word has no vowels, don't change it. You may assume all
# letters are lower-case.
#
# hipsterfy("towel flicker banana") => "towl flickr banan"

def hipsterfy(sentence)
  new_sentence = ""
  sentence.split(" ").each do |word|
     new_sentence += remove_last_vowel(word) 
  end
  
  p new_sentence[0..new_sentence.length-2]
end

def remove_last_vowel(word)
  new_word = ""
  num_vowel = 0
  
  word.reverse.chars.each do |c|
    num_vowel += 1 if is_vowel?(c) # "aeiou".include?(c)
    next if is_vowel?(c) && num_vowel == 1
    new_word += c
  end
  new_word.reverse + ' '
end

def is_vowel?(c) 
  c == 'a' || c=='e' || c== 'i' || c=='o' || c=='u' ? true : false
end

puts "-------Hipsterfy-------"
puts hipsterfy("proper") == "propr"
puts hipsterfy("mstrkrft") == "mstrkrft"
puts hipsterfy("towel flicker banana") == "towl flickr banan"
puts hipsterfy("turtle cheeseburger fries") == "turtl cheeseburgr fris"
