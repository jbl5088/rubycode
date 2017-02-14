# Define a method that accepts two arguments, a string and an integer. The method should return a copy of the string with the nth letter removed.
def remove_nth_letter(string, n)
  copy_str = ""
  n < 0 ? new_n = string.length+n: new_n = n
  string.chars.each_with_index do |c, i|
    copy_str = copy_str + c if i != new_n
  end
  copy_str
end

# Define a method that chunks an array into a nested array of sub-arrays of length n. The last array may be of length less than n if the original array's size does not divide evenly by n.
# chunk([1,2,3,4,5], 2) => [[1,2], [3,4], [5]]
def chunk(array, n)
  # [0..n-1] [n..2n-1] [2n..array.count-1]
  result = []
  head = 0 
  tail = 0
  size = array.count
  # sub_arr = []
  return array if n > array.count - 1
  
  array.each_with_index do |el, idx|
    if (idx+1) % n == 0 
      tail = idx
      result << array[head..tail] 
      head = idx+1
    end
  end

  if size % n != 0
    p size, last = size - (size% n) 
    result << array[last..size-1]
  end
    
  return result
  
end

# Define a method that multiplies the frequencies of the periods, commas, hyphens, semicolons, question marks, and exclamation points in a given string and returns the product. If any punctuation does not occur, don't include it in the product, i.e., don't multiply by zero!
def product_punctuation(str)
  # count only these punctuation marks (!.,-;?) in str and multiply their frequencies
  product = 1
  
  str.chars.uniq.each do |c|
    if c == '!' || c == '.' || c == ',' || c=='-' || c==';' || c=='?'
      product *= str.count(c)
    end
  end
  
  product
end

# Translate a sentence into pig-latin! The first consonants go to the end of the word, then add "ay".
def pig_latin(sentence)
  # move the first vowel to the front of each word
  # add 'ay' to the end of each word
  words = sentence.split(/\W+/)
  result = ""
  
  words.each do |word|
    str_head = ""
    str_tail = ""
    is_first_vowel = false
    word.chars.each do |c|
      is_first_vowel = true if c == 'a' || c == 'e' || c=='i' || c=='o' || c== 'u'
      
      if is_first_vowel
        str_head += c 
      else 
        str_tail += c 
      end 
    end
    result = result + str_head + str_tail + 'ay '
  end
  result[0..result.length-2]
end



require_relative 'test.rb'