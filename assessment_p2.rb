# Given an array of words, remove all the occurrences of the letter 'a' in those words and return the resulting array.
def remove_letter_a(words)
  result = []
  words.each do |word|
    new_word = ""
    word.chars.each do |c|
      new_word << c if c != 'a'
    end
    result << new_word
  end
  result
end

# An abundant number is less than the sum of its divisors, not including itself. 12's divisors are 1, 2, 3, 4, 6, which sum to 16. xw16 > 12 so 12 is an abundant number.
# Write a method that, given a number, returns a boolean indicating whether that number is abundant.
def abundant?(num)
  sum = 0
  # find all divisors of num
  (1..num-1).each do |i|
    sum += i if num % i == 0 
  end
  sum > num
end

# Return the greatest number that's a factor of both inputs.
# greatest_common_factor(6, 10) => 2
# greatest_common_factor(10, 15) => 5
def greatest_common_factor(first_number, second_number)
  max = [first_number, second_number].max
  
  (max-1).downto(1).each do |i|
    return i if first_number % i == 0 && second_number % i == 0
  end
  return nil
end

# Write a method that, given a sentence without punctuation or capitalization, returns the word with the greatest number of repeated letters. Return the first word if there's a tie. It doesn't matter how often individual letters repeat, just that they repeat.
# word_with_most_repeats("I took the road less traveled and that has made all the difference") => "difference" because "difference" has two repeated letters, more than the other words.
def word_with_most_repeats(sentence)
    words = sentence.split(/\W/)
    best_word = ""
    most_repeats = 0
    
    words.each do |word|
        word.chars.each do |c|
            letter_repeats = word.count(c)
            if letter_repeats > most_repeats
                most_repeats = letter_repeats
                best_word = word
            end
        end
    end
    best_word
end

require_relative 'test.rb'