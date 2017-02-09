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

def cats_in_hats
    # your code here
    hats = Array.new(100, false) # hat status of 100 cats
    result = []                  # result array contains indices of cats with hats
    
    # iterate 100 rounds of visiting cats
    (0..99).each do |j|
        round = j+1
        i = j
        while i < 100
            if hats[i] == true
                hats[i] = false
                else
                hats[i] = true
            end
            i += round
        end
    end
    
    
    hats.each_with_index do |h, i|
        result << i+1 if h == true
    end
    result
end

puts "------Cats in Hats------"
puts cats_in_hats == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
