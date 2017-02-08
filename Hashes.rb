# EASY

# Define a method that, given a sentence, returns a hash of each of the words as keys with their lengths as values. Assume the argument lacks punctuation.
def word_lengths(str)
  h = Hash.new()
  str.split(/\W+/).each do |word|
    h[word] = word.length
  end
  h
end

# Define a method that, given a hash with integers as values, returns the key with the largest value.
def greatest_key_by_val(hash)
  greatest_val = 0
  hash.each do |key, value|
    greatest_val = value if value > greatest_val
  end
  hash.key(greatest_val)
end

# Define a method that accepts two hashes as arguments: an older inventory and a newer one. The method should update keys in the older inventory with values from the newer one as well as add new key-value pairs to the older inventory. The method should return the older inventory as a result.
# march = {rubies: 10, emeralds: 14, diamonds: 2}
# april = {emeralds: 27, moonstones: 5}
# update_inventory(march, april) => {rubies: 10, emeralds: 27, diamonds: 2, moonstones: 5}
def update_inventory(older, newer)
  #older.merge(newer)
  inventory = Hash.new(0)
  older.each do |o_key, o_val|
    inventory[o_key] = o_val
    newer.each do |n_key, n_val|
      inventory[n_key] = n_val
    end
  end
  inventory
end

# Define a method that, given a word, returns a hash with the letters in the word as keys and the frequencies of the letters as values.  the counts of each letter
def letter_counts(word)
  counter = Hash.new(0)
  word.split(//).each do |c|
    counter[c] += 1
  end
  counter
end


# MEDIUM

# Define a method that, given an array, returns its argument without duplicates. Use a hash! Don't use the uniq method.
def uniq(arr)
  uniq_arr = []
  counter = Hash.new(0)
  arr.each do |el|
    counter[el] += 1
    uniq_arr << el if counter[el] <= 1
  end
  uniq_arr
end

# Define a method that, given an array of numbers, returns a hash with "even" and "odd" as keys and the frequency of each parity as values.
def evens_and_odds(numbers)
  frequency = {"even" => 0, "odd" => 0}
  numbers.each do |num|
    frequency["even"] += 1 if num.even?
    frequency["odd"] += 1 if num.odd?
  end
  frequency
end

# Define a method that, given a string, returns the most common vowel. If there's a tie, return the vowel that occurs earlier in the alphabet. Assume all letters are lower case.
def most_common_vowel(string)
  frequency = {'a' => 0, 'e' => 0, 'i' => 0, 'o' => 0, 'u' => 0}
  most_f = 0 # the greatest frequency of common vowel
  
  string.downcase.split(//).each do |c|
    frequency[c] += 1 if c == 'a' || c == 'e' ||c == 'i' ||c == 'o' ||c == 'u' 
  end
  
  frequency.each do |key, n|
    most_f = n if n > most_f
  end
  
  frequency.key(most_f)
end


# HARD

# Define a method that, given a hash with keys as student names and values as their birthday months (numerically, e.g., 1 corresponds to January), returns every combination of students whose birthdays fall in the second half of the year (months 7-12).
# students_with_birthdays = {
#   "Asher" => 6,
#   "Bertie" => 11,
#   "Dottie" => 8,
#   "Warren" => 9
# }
# fall_and_winter_birthdays(students_with_birthdays) => [
#   ["Bertie", "Dottie"],
#   ["Bertie", "Warren"],
#   ["Dottie", "Warren"]
# ]
def fall_and_winter_birthdays(students_with_birthdays)
  arr = [] # students who have birthday in fall and winter
  combination = [] # combination of students who have birthday in fall and winter
  
  # find the students who have birthdays on between 7 and 12
  students_with_birthdays.each do |key, val|
    arr << key if val >=7 && val <= 12
  end

  # find the combination of students
  (0..arr.count-1).each do |i|
    (i+1..arr.count-1).each do |j|
      combination << [arr[i], arr[j]] 
    end
  end
  combination
end

# Define a method that, given an array of specimens, returns the biodiversity index as defined by the following formula:
# number_of_species**2 * smallest_population_size / largest_population_size
# biodiversity_index(["cat", "cat", "cat"]) => 1
# biodiversity_index(["cat", "leopard-spotted ferret", "dog"]) => 9
def biodiversity_index(specimens)
  population = Hash.new(0) # punctuation of each species
  largest_population_size = 0 
  smallest_population_size = 0 
  number_of_species = 0

  # find the population of each species 
  specimens.each do |s|
    population[s] += 1
  end 
  
  # find the largest, smallest population size and number_of_species
  population.each do |key, val|
    if smallest_population_size == 0 # initialize the smallest_population_size to the population of the first specie
      smallest_population_size = val
    end
    
    smallest_population_size = val if val < smallest_population_size
    largest_population_size = val if val > largest_population_size
    number_of_species += 1
  end

  number_of_species**2 * smallest_population_size / largest_population_size
end

# Define a method that, given the string of a respectable business sign, returns a boolean indicating whether pranksters can make a given vandalized string using the available letters. Ignore capitalization and punctuation.
# can_tweak_sign("We're having a yellow ferret sale for a good cause over at the pet shop!", "Leopard ferrets forever yo") => true
def can_tweak_sign?(normal_sign, vandalized_sign)
  
end

def character_count(str)
  
end

require_relative "test.rb"
