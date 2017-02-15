# Number Counting Sequence
# ------------------------------------------------------------------------------
# The number counting sequence is a sequence of number strings that begins with:
# ["1", "11", "21", "1211", "111221", ...]
#
# "1" is counted as "one 1" or "11", followed by
# "11" which is counted as "two 1s" or "21", followed by
# "21" which is counted as "one 2 and one 1" or "1211", and so on.
#
# It helps to "say it out loud" to describe the item in the sequence.
#
# Given an integer n, generate the n-th element in the number counting sequence.

def number_counting_seq(n)

  return "" if n <= 0  # base case
  return "1" if n == 1 # base case

  i = 1
  post_str = ""
  pre_str = "1"
  until i >= n
    post_str = say_it_out(pre_str)
    pre_str = post_str
    i += 1
  end
  post_str
end

def say_it_out(pre_str)
  # [], [1], [1,1], [2,1], [1,1,1,2,2,1]
  # take a pre-sequence string input, output a post sequence string
  str = "" # post sequence string
  cnt = 0  # sequence number counter
  seq_nums = [] # convert pre-sequnce string to seq_nums array
  pre_str.chars.each do |num|
    seq_nums << num.to_i
  end
  pivot_num = seq_nums.first

  seq_nums.each_with_index do |num, idx|
    cnt += 1 if num == pivot_num
    next_num = seq_nums[idx+1]

    if num != next_num || next_num == nil
      str << (cnt.to_s + num.to_s)
      pivot_num = next_num
      cnt = 0
    end
  end
  str
end


# say_it_out("21")

puts "-------Number Counting Sequence-------"
puts number_counting_seq(0) == ""
puts number_counting_seq(1) == "1"
puts number_counting_seq(2) == "11" # one 1 above
puts number_counting_seq(3) == "21" # two 1s above
puts number_counting_seq(5) == "111221" #the last sequence was one 1, one 2, and two 1s: "1211"
puts number_counting_seq(8) == "1113213211"
puts number_counting_seq(10) == "13211311123113112211"
