# Compound Words

# Define a method, #compound_words?(word_list, target), that accepts 2 arguments:
# an array of words and a target, compound word. Check to see if any two words
# in the list can be combined to make the compound word. Don't double-use words.


def compound_words?(array, target)
    # your code here
    #p "here"
    array.each_with_index do |w1, i|
        array.each_with_index do |w2, j|
            next if i == j
            #p i, j, w1, w2
            return true if w1 + w2 == target
        end
    end
    return false
end

puts "------Compound Words------"
puts compound_words?(["ice", "cream"], "icecream") == true
puts compound_words?(["cake", "candle", "cup", "wish"], "cupcake") == true
puts compound_words?(["hello", "bye", "greetings"], "byebye") == false
