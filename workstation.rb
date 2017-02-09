def word_most_repeats(string)
    words = string.split(/\W/)
    best_word = ""
    most_repeats = 0
    
    words.each do |word|
        word.chars.each do |c|
            letter_repeats = word.count(c)
            if letter_repeats > most_repeats
                most_repeats = letter_repeats
                best_word = word
            end
        end
    end
    p best_word
end


string = "Intense as the atmosphere may be, the Mavericks are sequences prepared. They’ve been building toward this night since February, when the University Interscholastic League—the governing aaa"

p "testing word_most_repeats(string) \n"
p "==================================================\n"
word_most_repeats(string) == "sequences"
