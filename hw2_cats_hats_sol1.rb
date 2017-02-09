# You have 100 cats.
#
# Your rules are simple: whenever you visit a cat, you toggle it's hat status (if it
# already has a hat, you remove it.. if it does not have a hat, you put one on).
# All of the cats start hat-less. You cycle through 100 rounds of visiting cats.
# In the 1st round, you visit every cat. In the second round, you visit every other cat.
# In the nth round, you visit every nth cat.. until the 100th round, in which you only
# visit the 100th cat.
#
# At the end of 100 rounds, which cats have hats?

def update_cats(cats, skip_dist)
	idx = skip_dist - 1
	while idx < cats.length
		cats[idx] = !cats[idx]
		idx += skip_dist
	end
end

def process_cats(cats)
	result = []
	cats.each_with_index do |cat, idx|
		if cat == true
			result << idx + 1
		end
	end
	result
end

def cats_in_hats
  # your code here
  cats = Array.new(100,false) 
  round = 1
  while round <= 100
  	 update_cats(cats, round)
  	 round += 1
  end
  process_cats(cats)
end

puts "------Cats in Hats------"
puts cats_in_hats == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
