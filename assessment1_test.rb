# Instructions
# Make sure everything puts out as 'true' when you run the file.
# When time is up, make sure you don't have any unexpected `end`s or infinite loops
# that would keep your code from running.
# Rename the file to be your firstname and lastname.
#
# Do not use the internet.  Do not reference the exercises.  If you forget a
# particular ruby method, write it yourself.
#
# Do not change the parameters passed into the functions in this file.
#
# Test your code with a few cases in addition to the ones we give
# you.
#
# Write as many helper methods as you need!
#
# Good luck!



# Long Word Count

# Return the number of words longer than 7 characters
# "cat cactus balderdash phenomenon amazon" has two words over 7 characters long
# "balderdash" and "phenomenon"
# long_word_count("cat cactus balderdash phenomenon amazon") => 2

def long_word_count(text)
    
    # long_word_count = 0
    # text.split(/\W+/).each do |word|
    #   long_word_count += 1 if word.length > 7
    # end
    # long_word_count
    
    text.split(/\W+/).select {|word| word.length > 7}.count
end

puts "-------Long Word Count-------"
puts long_word_count("") == 0
puts long_word_count("short words only") == 0
puts long_word_count("one reallylong word") == 1
puts long_word_count("two reallylong words inthisstring") == 2



# Calculate

# Define a method, #calculate, that accepts two arguments: a starting value and an
# array of commands. The method should preform the specified commands and return the
# final value. An example of commands might look like:

# [["+", 3], ["/",4 ], ['-', 10], ["*", 6]]

# Note that this is an array of arrays, where the first element is the operation to perform,
# and the second argument is the value to use in the operation. You only need to account
# for the 4 basic operations: +, -, *, and /

# ex: calculate(3, [["*", 5]]) ==> 3 * 5 == 15
# ex: calculate(2, [["+", 2], ["/",4 ]]) ==> (2 + 2) / 4 == 1

def calculate(starting_value, operations)
    result = starting_value
    
    operations.each do |op|
        if op[0] == '+'
            result += op[1]
            elsif op[0] == '-'
            result -= op[1]
            elsif op[0] == '*'
            result *= op[1]
            elsif op[0] == '/'
            result /= op[1]
        end
    end
    result
end


puts "-------Calculate-------"
puts calculate(3, [["*", 5]]) == 15
puts calculate(2, [["+", 2], ["/",4 ]]) == 1
puts calculate(0, [["+", 3], ["/", 3], ['-', 10], ["*", 6]]) == -54
puts calculate(10, [["+", 1], ["+", 10], ['-', 3], ["/", 2]]) == 9



# Hashtagify

# Given a sentence string and an array of words, hashtag-ify the words (case-insensitive)
# in the original string and return the updated cool string with hashtags.

def hashtagify(sentence, tags)
    new_sentence = ""
    sentence.split.each do |word|
        tags?(word, tags) ? new_sentence << '#' + word + ' ' : new_sentence += word + ' '
    end
    
    new_sentence[0..new_sentence.length-2]
end

def tags?(word, tags)
    
    tags.each do |tag|
        return true if word.downcase.include?(tag)
    end
    return false
end

puts "-------Hashtagify-------"
puts hashtagify("coding", ["coding"]) == "#coding"
puts hashtagify("coding is fun", ["coding", "fun"]) == "#coding is #fun"
puts hashtagify("Learned about coding. Coding is fun!", ["coding", "fun"]) == "Learned about #coding. #Coding is #fun!"



# Vigenere Cipher

# Vigenere's Cipher is a tool for encrypting strings. We'll offset each character
# according to a key sequence. For example, if we encrypt "bananasinpajamas" with the
# key sequence [1, 2, 3], the result would be "ccqbpdtkqqcmbodt":
#
# Word:   b a n a n a s i n p a j a m a s
# Keys:   1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1
# Cipher: c c q b p d t k q q c m b o d t
#
# Note that offsets should wrap around the alphabet - offsetting 'z' by 1 should
# produce 'a'

# Write a method that takes a string and a key-sequence, returning
# the encrypted word. Assume only lower-case letters are used.

# We're giving you the alphabet as an array if you need it.


def vigenere_cipher(string, key_sequence)
    alphabet = ("a".."z").to_a
    new_str = ""
    key_cnt = 0
    
    string.chars.each do |c|
        new_key = key_sequence.first + alphabet.index(c)
        new_str += alphabet[new_key%26]
        key_sequence.push(key_sequence.first)
        key_sequence.shift
    end
    
    new_str
end


# def update_key(index)

puts "----Vigenere cipher----"
puts vigenere_cipher("toerrishuman", [1]) == "upfssjtivnbo"
puts vigenere_cipher("toerrishuman", [1, 2]) == "uqftsktjvobp"
puts vigenere_cipher("toarrispirate", [1, 2, 3, 4]) == "uqdvskvtjtdxf"
puts vigenere_cipher("zzz", [1, 2, 1]) === "aba"
