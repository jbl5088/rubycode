# Define a method that accepts two arguments, a string and an integer. 
# The method should return a copy of the string with the nth letter removed.
def remove_nth_letter(string, n)
  result = string
  result[n] = ""
  result
end

# Define a method that chunks an array into a nested array of sub-arrays of length n. 
# The last array may be of length less than n if the original array's size does not divide evenly by n.
# chunk([1,2,3,4,5], 2) => [[1,2], [3,4], [5]]
def chunk(array, n)
  arr = array.dup
  result = [] 
  while arr.length >0
    result << arr.shift(n)
  end
  p result
end

# Define a method that multiplies the frequencies of the periods, commas, hyphens, semicolons, question marks, 
# and exclamation points in a given string and returns the product. If any punctuation does not occur, 
# don't include it in the product, i.e., don't multiply by zero!
def product_punctuation(str)
  result = 1
  str.chars.uniq.each do |p|
    result *= str.count(p) if p =~ /[!.,-;?]/
  end
  result
end

# Translate a sentence into pig-latin! The first consonants go to the end of the word, then add "ay".
def pig_latin(sentence)
  new_words =  []
  sentence.split(/\W+/).each do |w|
    new_words << latinize(w)
  end
  new_words.join(' ')
end

def latinize(word)
  chars = word.chars
  new_word = ""
  first_vowel = 0
  first_vowel = (word =~ /[aeiou]/) unless !(word =~ /[aeiou]/)
    
  if first_vowel <= 0 
    new_word = (word + "ay") 
  else
    head = chars[first_vowel..word.length].join 
    tail = chars[0..first_vowel-1].join + "ay"
    new_word = head + tail
  end
  new_word
end 

$success_count = 0
$failure_count = 0

def deep_dup(arr)
  arr.inject([]) { |acc, el| el.is_a?(Array) ? acc << deep_dup(el) : acc << el }
end

def note_success(returned, invocation, expectation)
  puts "success: #{invocation} => #{expectation}"
  $success_count += 1
end

def note_failure(returned, invocation, expectation)
  puts "failure: #{invocation}: expected #{expectation}, returned #{returned}"
  $failure_count += 1
end

def format_args(args)
  o_args = deep_dup(args)
  o_args.map! do |arg|
    arg = prettify(arg)
    arg.class == Array ? arg.to_s : arg
  end
  o_args.join(', ')
end

def prettify(statement)
  case statement
  when Float
    statement.round(5)
  when String
    "\"#{statement}\""
  when NilClass
    "nil"
  else
    statement
  end
end

def equality_test(returned, invocation, expectation)
  if returned == expectation && returned.class == expectation.class
    note_success(returned, invocation, expectation)
  else
    note_failure(returned, invocation, expectation)
  end
end

def identity_test(returned, invocation, expectation, args)
  if returned.__id__ == args[0].__id__
    equality_test(returned, invocation, expectation)
  else
    puts "failure: #{invocation}: You did not mutate the original array!"
    $failure_count += 1
  end
end

def method_missing(method_name, *args)
  method_name = method_name.to_s
  expectation = args[-1]
  args = args[0...-1]
  if method_name.start_with?("test_")
    tested_method = method_name[5..-1]
    print_test(tested_method, args, expectation)
  else
    method_name = method_name.to_sym
    super
  end
end

def print_test(method_name, args, expectation)
  returned = self.send(method_name, *args)
  returned = prettify(returned)
  expectation = prettify(expectation)
  args_statement = format_args(args)
  invocation = "#{method_name}(#{args_statement})"
  method_name.include?("!") ? identity_test(returned, invocation, expectation, args) : equality_test(returned, invocation, expectation)
  rescue Exception => e
    puts "failure: #{invocation} threw #{e}"
    puts e.backtrace.select {|t| !t.include?("method_missing") && !t.include?("print_test")}
    $failure_count += 1
end

puts "\wremove_nth_letter:\n" + "*" * 15 + "\n"
test_remove_nth_letter("helloworld", 5, "helloorld")
test_remove_nth_letter("helloworld", -3, "hellowold")
puts "\wchunk:\n" + "*" * 15 + "\n"
test_chunk([1,2,3,4,5], 2, [[1,2], [3,4], [5]])
test_chunk([1, 8, 9, 4, "hey", "there"], 2, [[1, 8], [9, 4], ["hey", "there"]])
puts "\wproduct_punctuation:\n" + "*" * 15 + "\n"
test_product_punctuation("!.,-;?", 1)
test_product_punctuation("There's a certain Slant of light, Winter Afternoons - That oppresses, like the Heft Of Cathedral Tunes - ", 4)
puts "\wpig_latin:\n" + "*" * 15 + "\n"
test_pig_latin("i speak pig latin", "iay eakspay igpay atinlay")
test_pig_latin("throw me an aardvark", "owthray emay anay aardvarkay")
puts
puts "TOTAL CORRECT: #{$success_count} / #{$success_count + $failure_count}"
puts "TOTAL FAILURES: #{$failure_count}"
$success_count = 0
$failure_count = 0