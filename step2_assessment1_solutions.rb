# Long Word Count
# ------------------------------------------------------------------------------
# Return the number of words longer than 7 characters
# "cat cactus balderdash phenomenon amazon" has two words over 7 characters long
# "balderdash" and "phenomenon"
# long_word_count("cat cactus balderdash phenomenon amazon") => 2

def long_word_count(text)
  text.split.count do |word|
    word.length > 7
  end
end


# Calculate
# ------------------------------------------------------------------------------
# Define a method, #calculate, that accepts two arguments: a starting value and an
# array of commands. The method should preform the specified commands and return the
# final value. An example of commands might look like:

# [["+", 3], ["/",4 ], ['-', 10], ["*", 6]]

# Note that this is an array of arrays, where the first element is the operation to perform,
# and the second argument is the value to use in the operation. You only need to account
# for the 4 basic operations: +, -, *, and /

# ex: calculate(3, ["*", 5]) ==> 3 * 5 == 15
# ex: calculate(2, ["+", 2], ["/",4 ]) ==> (2 + 2) / 4 == 1

def do_math(operand, val1, val2)
  case operand
  when "+"
    val1 + val2
  when "-"
    val1 - val2
  when "*"
    val1 * val2
  when "/"
    val1 / val2
  end
end

def calculate(starting_value, operations)
  operations.reduce(starting_value) do |accum, operation|
    operand, val2 = operation # parallel assignment -- x, y = [1, 2]
    do_math(operand, accum, val2)
  end
end


# Hashtagify
# ------------------------------------------------------------------------------
# Given a sentence string and an array of words, hashtag-ify the words (case-insensitive)
# in the original string and return the updated cool string with hashtags.

def hashtagify(sentence, tags)
  temp = sentence.split

  temp.map! do |word|
  	if tags.any? { |tag| word.downcase.include?(tag) }
      "#" + word
    else
      word
    end
  end

  temp.join(" ")
end


# Vigenere Cipher
# ------------------------------------------------------------------------------
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

# ------------------------------------------------------------------------------

def vigenere_cipher(string, key_sequence)
  result = ""
  string.each_char.with_index do |c, idx|
    key_idx = idx % key_sequence.length
    key = key_sequence[key_idx]
    result << shift(c, key)
  end
  result
end

def shift(c, idx)
  alphabet = ("a".."z").to_a
  offset = (alphabet.index(c) + idx) % alphabet.length
  alphabet[offset]
end
