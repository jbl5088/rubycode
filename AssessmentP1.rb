# Anagrams are two words with exactly the same letters. Order does not matter. Define a method that, given two strings, returns a boolean indicating whether they are anagrams.
def anagrams?(str1, str2)
  letters_1 = str1.split(//).uniq.sort
  letters_2 = str2.split(//).uniq.sort
  
  return true if letters_1 == letters_2
  return false
end

# An isogram is a word of only non-repeating letters. Define a method that, given two isograms of the same length, returns an array of two elements indicating matches: the first number is the number of letters matched in both words at the same position, and the second is the number of letters matched in both words but not in the same position.
def isogram_matcher(isogram1, isogram2)
  
  counter_1 = 0
  counter_2 = 0
  isogram1.split(//).each_with_index do |c1, i|
    isogram2.split(//).each_with_index do |c2, j|
      if c1==c2
        if i==j 
          counter_1 += 1 
        else
         counter_2 += 1 
        end
      end
    end
  end
  [counter_1, counter_2]
end

# You have a panoramic view in front of you, but you only can take a picture of two landmarks at a time (your camera is small). You want to capture every pair of landmarks that are next to each other. Define a method that, given an array of landmarks, returns an array of every adjacent pair from left to right. Assume the panorama wraps around.
def panoramic_pairs(landmarks)
  # [A...Z] => [[A,B], [C,D], ..]
  index = 0
  panoramic_pairs =[]
  
  while index < landmarks.count do
    panoramic_pairs << [landmarks[index], landmarks[index+1]]
    index += 1
    
    if index >= landmarks.count - 1 # special case: reached the last element
      panoramic_pairs << [landmarks[index], landmarks[0]] 
      break
    end
  end
  
  panoramic_pairs
end

# Xbonacci

# Define a Xbonacci method that works similarly to the fibonacci sequence.
# The fibonacci sequence takes the previous two numbers in the sequence and adds
# them together to create the next number.
#
# First five fibonacci numbers = [1, 1, 2, 3, 5]
# The fourth fibonacci number (3) is the sum of the two numbers before it
# (1 and 2).
#
# In Xbonacci, the sum of the previous X numbers (instead of the previous 2 numbers)
# of the sequence becomes the next number in the sequence.
#
# The method will take two arguments: the starting sequence with X number of
# elements and an integer N. The method will return the first N elements in the given
# sequence.
#
# xbonacci([1, 1], 5) => [1, 1, 2, 3, 5]
# xbonacci([1, 1, 1, 1], 8) => [1, 1, 1, 1, 4, 7, 13, 25]
#
# X is the length of the starting sequence.
#
# number_of_xbonacci_numbers_to_return is the same as N.

def xbonacci(starting_sequence, number_of_xbonacci_numbers_to_return)
  xbonacci_nums = starting_sequence      # array of xbonacci_nums 
  size_nums = starting_sequence.count    # 
  nums = Array.new(size_nums,1)          # copy of starting sequence of numbers 
  
  
  index_nums = 0
  counter = size_nums -1
  
  while counter < number_of_xbonacci_numbers_to_return-1 do
    x_num = nums.reduce(:+)     # set x_num to the sum of requence numbers
    xbonacci_nums << x_num      # append x_num to array of xbonacci_nums
    
    nums[index_nums%size_nums] = x_num # update the copy of starting sequence numbers
    index_nums += 1  
    counter +=1
  end
  
  xbonacci_nums
end

require_relative "test.rb"
