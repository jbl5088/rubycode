# Define a method that returns a boolean indicating whether its second argument is a substring of its first.
def substring?(long_string, short_string)
  long_string.include?(short_string) ? true : false
end

# Write a method that, given a string, returns a hash in which each key is a character in the string and each value is an array of the first and last indices where that character occurs. If the character occurs only once, the array should contain a single index. Consider defining helper methods.
# first_last_indices("banana") => {"b" => [0], "a" => [1, 5], "n" => [2, 4]}
def first_last_indices(str)
  # find the uniq chars
  # find the first index of uniq chars from str
  # find the last index of uniq chars from str.reverse
  # if first index == last index, return only one index
  h = Hash.new # result
  str
  uniq_chars = str.chars.uniq 
  uniq_chars.each do |c|
    first_idx = str.index(c)
    last_idx = str.length - 1 - str.reverse.index(c)
    first_idx == last_idx ? h[c] = [first_idx] : h[c] = [first_idx, last_idx]
  end
  
  h
end


# Define a method that returns the number of times that two adjacent numbers in an array sum to n. Don't reuse numbers.
# count_adjacent_sums([1, 5, 1, 3, 3], 6) => 2
def count_adjacent_sums(array, n)
  sum = 0
  jump = false
  array.each_with_index do |num, i|
    if i == array.count - 1 || jump
      jump = false
      next
    end
    # p "#{num} + #{array[i+1]} == #{n}"
    if num + array[i+1] == n
      jump = true
      sum += 1
    end
  end 
  sum
end
  
require_relative 'test.rb'
