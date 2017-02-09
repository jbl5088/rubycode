# EASY

# Define a method that returns the sum of all the elements in its argument (an array of numbers).
def array_sum(arr)
  arr.reduce(:+)
end

# Define a method that returns a boolean indicating whether substring is a substring of all the long_strings (an array).
def in_all_strings?(long_strings, substring)
  return true if long_strings.select {|string| string.include?(substring) }.count == long_strings.count
  return false
end

# Define a method that accepts a string of lower case words (no punctuation) and returns an array of letters that occur more than once.
def non_unique_letters(string)
  non_unique_letters = []
  counters = Hash.new(0)
  arr = string.downcase.split(//).select {|letter| string.count(letter) > 1}
  
  arr.each do |c|
    counters[c] += 1
    non_unique_letters << c if counters[c] <= 1 
  end
  
  return non_unique_letters
end

# Define a method that returns an array of the longest two words (in order) in the method's argument. Ignore punctuation!
def longest_two_words(string)
  words = string.split(/\W+/)
  size = words.count
  return words.sort_by {|w| w.length}[size-2, size] if size > 2
  return words
end


# MEDIUM

# Define a method that returns an array of letters that do not occur in the method's argument.
def missing_letters(string)
  missing_letters = []
  str = string.downcase
  ('a'..'z').each do |c|
    missing_letters << c if !str.include?(c)
  end
  missing_letters
end

# Define a method that accepts two years and returns an array of the years within that range (inclusive) that have no repeated digits. Hint: helper method?
def no_repeat_years(first_yr, last_yr)
  years = []
  (first_yr..last_yr).each do |yr|
    years << yr if not_repeat_year?(yr)
  end
  years
end

def not_repeat_year?(year)
  arr = year.to_s.split(//)
  arr.each do |num|
    return false if arr.count(num) > 1
  end
  return true
end


# HARD

# Define a method that, given an array of songs at the top of the charts, returns the songs that only stayed on the chart for a week at a time. Each element corresponds to a song at the top of the charts for one particular week.
# Songs CAN reappear on the chart, but if they don't appear in consecutive weeks, they're "one-week wonders."
# Suggested strategy: find the songs that appear multiple times in a row and remove them.
# You may wish to write a helper method no_repeats?
def one_week_wonders(songs)
  songs.select {|song| no_repeats?(song, songs)}.uniq
end

def no_repeats?(song_name, songs)
  
  songs.each_with_index do |song, i|
    if song_name == song
      return false if songs[i+1] == song
    end
  end
end


# Define a method that, given a string of words, returns the word that has the letter "c" closest to the end of it. If there's a tie, return the earlier word. Ignore punctuation. If there's no "c", return an empty string. You may wish to write the helper methods c_distance and remove_punctuation.
def for_cs_sake(string)
  string.split(/\W+/).sort_by{|w| c_distance(w)}.last
end

def c_distance(word)
  c_dis = 0
  word.split("").each_with_index do |c, i|
    c_dis = i if c =="c"
  end
  c_dis
end


# Define a method that, given an array of numbers, returns a nested array of two-element arrays that each contain the start and end indices of whenever a number appears multiple times in a row.
# repeated_number_ranges([1, 1, 2]) => [[0, 1]]
# repeated_number_ranges([1, 2, 3, 3, 4, 4, 4]) => [[2, 3], [4, 6]]
def repeated_number_ranges(arr)
  result = [] # array of repeated_number_ranges
  size = arr.count # size of the input arr
  head = 0 # head of the range
  tail = -1 # tail of the range

  (head+1..size-1).each do |i|
    
    head = i if arr[i] != arr[head] && i-head == 1 # update head if no repeated number
    
    if arr[i] == arr[head] # update tail until no more repeated numbers
      tail = i
      next # break and go to next iteration
    end
    
    if tail > head # append the range of head and tail to the result when it is determined
      result << [head,tail]
      head = i+1 # update head of the range
    end
  end
  
  result
end

require_relative "test.rb"
