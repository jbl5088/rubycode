# Define a method that returns a boolean indicating whether its second argument is a substring of its first.
def substring?(long_string, short_string)
  long_string.include?(short_string)
end

# Write a method that, given a string, returns a hash in which each key is a character in the string and
# each value is an array of the first and last indices where that character occurs. If the character 
# occurs only once, the array should contain a single index. Consider defining helper methods.
# first_last_indices("banana") => {"b" => [0], "a" => [1, 5], "n" => [2, 4]}
def first_last_indices(str)
  chars = str.chars
  result = Hash.new([])
  chars.uniq.each do |c|
    first = chars.index(c)
    last = chars.rindex(c) 
    first == last ? result[c] = [first] : result[c] = [first, last]
  end
  result
end

# Define a method that returns the number of times that two adjacent numbers in an array sum to n. Don't reuse numbers.
# count_adjacent_sums([1, 5, 1, 3, 3], 6) => 2
def count_adjacent_sums(array, n)
  arr = array.dup
  count_n = 0
  while arr.length > 0
    pair = arr.shift(2)
    pair[1] == nil ? break : sum = pair.reduce(:+)
    if sum == n 
      count_n += 1
    else
      arr.unshift(pair[1])
    end
  end
  count_n
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

puts "\wsubstring?:\n" + "*" * 15 + "\n"
test_substring?("thisisaverylongstring", "sisa", true)
test_substring?("thisisaverylongstring", "ting", false)
puts "\wfirst_last_indices:\n" + "*" * 15 + "\n"
test_first_last_indices("banana", {"b" => [0], "a" => [1, 5], "n" => [2, 4]})
test_first_last_indices("racecar", {"r" => [0, 6], "a" => [1, 5], "c" => [2, 4], "e" => [3]})
puts "\wcount_adjacent_sums:\n" + "*" * 15 + "\n"
test_count_adjacent_sums([1, 5, 1, 3, 3], 6, 2)
test_count_adjacent_sums([7, 2, 4, 6, 8, 10], 7, 0)
puts
puts "TOTAL CORRECT: #{$success_count} / #{$success_count + $failure_count}"
puts "TOTAL FAILURES: #{$failure_count}"
$success_count = 0
$failure_count = 0
