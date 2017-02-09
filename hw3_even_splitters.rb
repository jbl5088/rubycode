# Even Splitters
# ------------------------------------------------------------------------------
# Return an array of characters on which we can split an input string to produce
# substrings of the same length.

# Don't count empty strings after the split.

# Here's an example for "banana":
#
# "banana".split("a") # => ["b", "n", "n"] (all elements same length)
# "banana".split("b") # => ["", anana"] (all elements same length - there's only
# one element "anana" because the empty string doesn't count)
# "banana".split("n") # => ["ba", "a", "a"] (all elements NOT same length)
#
# result: ["b", "a"]
#
# ------------------------------------------------------------------------------

def even_splitters(string)
  result = []   # define a result array
  
  uniq_chars = string.chars.uniq # define a unique chars array
  
  uniq_chars.each do |c|
    result << c if element_same_length?(string.split(c))
  end
  
  result
end

def element_same_length?(elements)
 
  return true if elements.empty?
  
  len = elements.max.length
  elements.each do |el|
    next if el.length < 1
    return false if len != el.length
  end
  return true
end


puts "-----Even Splitters----"
puts even_splitters("") == []
puts even_splitters("t") == ["t"]
puts even_splitters("jk") == ["j", "k"]
puts even_splitters("xoxo") == ["x", "o"]
puts even_splitters("banana") == ["b","a"]
puts even_splitters("mishmash") == ["m","h"]