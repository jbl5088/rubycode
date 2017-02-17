# Instructions

# Make sure everything puts out as 'true' when you run the file.
# When time is up, make sure you don't have any unexpected `end`s or infinite loops
# that would keep your code from running.
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




# Maybe Zeroes

# You are given an array of numbers, and a boolean.

# Write a method that will remove all the zeroes from the numbers if
# drop is true and then add the numbers with the zeroes removed and
# return this sum. If  drop is false then add the given numbers and
# return the sum.

def maybe_zeroes(numbers, drop)
  sum = 0 
  if drop
    numbers.each do |num|
      digits = num.to_s.chars
      num_str = ""
      digits.each do |d|
        num_str += d if d != '0'
      end
      sum += num_str.to_i
    end
  else
    sum = numbers.reduce(:+)
  end
  sum
end

puts "-------Maybe Zeroes-------"

puts maybe_zeroes([100, 505, 9, 1002], true) == 77
puts maybe_zeroes([100, 505, 9, 1002], false) == 1616
puts maybe_zeroes([9000103, 43], true) == 956
puts maybe_zeroes([43, 7, 98], false) == 148


# Letter Swap

# You are given a sentence and an array of 2 letters

# Write a method that will return the sentence with any instance of
# the first letter switched with the second letter and vice versa.
# It should treat capitalized or lowercase letters the same.


def swap_letters(sentence, letters)
  result = ""
  sentence.chars.each do |c|
    if c.downcase == letters[0].downcase
      result += letters[1].downcase
    elsif c.downcase == letters[1].downcase
      result += letters[0].downcase
    else 
      result += c
    end
  end
  result
end

puts "-------Letter Swap--------"
puts swap_letters("I went to the dentist", ["n", "t"]) == "I wetn no nhe detnisn"
puts swap_letters("I went to the dentist", ["t", "n"]) == "I wetn no nhe detnisn"
puts swap_letters("My name is Michael", ["a", "m"]) == "ay nmae is aichmel"
puts swap_letters("My name is Michael", ["A", "m"]) == "ay nmae is aichmel"



# Transpose
#------------------------------------------------------------------------------
# You are given a n * n 2D matrix and your goal is to tranpose it.
# That means for any element that starts at position ij it should
# be returned to position ji. Do not use the Array#tranpose method.
#------------------------------------------------------------------------------
# Example:
# Matrix = [[1, 2],
# 					[3, 4]]
#
# transpose(Matrix) => [[1, 3],
# => 										[2, 4]]
#------------------------------------------------------------------------------
def transpose(matrix)
  n = matrix.length
  transpose = []
  
  matrix.each_with_index do |row, i|
    row.each_with_index do |el, j|
      transpose[j] = [] if transpose[j].nil?
      transpose[j][i] = el
    end
  end
  transpose
end
#------------------------------------------------------------------------------
puts "------- Transpose -------"
matrix_two = [[1, 2],
							[3, 4]]
matrix_three = [[1, 2, 3],
							  [4, 5, 6],
							  [7, 8, 9]]
matrix_four = [[1, 2, 3, 4],
							 [5, 6, 7, 8],
							 [9, 10, 11, 12],
							 [13, 14, 15, 16]]

puts transpose(matrix_two) == [[1, 3],
															 [2, 4]]
puts transpose(matrix_three) == [[1, 4, 7],
															   [2, 5, 8],
															   [3, 6, 9]]
puts transpose(matrix_four) == [[1, 5, 9, 13],
																[2, 6, 10, 14],
																[3, 7, 11, 15],
																[4, 8, 12, 16]]





# You are given a hash with letters as keys and mathematical operators as values,
# an input array of numbers and letters, and a starting value

# Write a method that goes takes the start value then goes through the input array
# performing the operation on the accumulated output and up until that point
# and the next number in the array. If a letter in the input does not appear in
# the hash, skip it and the number after it

# Example:
# hash = {"a" => "+", "z" => "*", "t", "/"}
# input = ["z", 5, "t", 8]
# start = 9
def calculater(hash, input, start)
  result = start
  tmp = input.dup
  while tmp.length > 0 
    operator = tmp.shift
    operand = tmp.shift
    if hash[operator] == "+"
      result += operand
    elsif hash[operator] == "-"
      result -= operand
    elsif hash[operator] == "/"
      result /= operand
    elsif hash[operator] == "*"
      result *= operand
    end
  end
  result
end

puts "---------Calculater---------"

hash = {"a" => "+", "z" => "*", "t" => "/"}
hash2 = { "y" => "*", "r" => "/", "u" => "-"}
puts calculater(hash, ["z", 5, "t", 8], 9) == 5
puts calculater(hash, ["z", 5, "z", 3], 3) == 45
puts calculater(hash2, ["a", 5, "y", 7, "r", 9, "u", 4], 8) == 2
puts calculater(hash2, ["y", 5, "u", 20, "r", 9, "y", 4], 0) == -12