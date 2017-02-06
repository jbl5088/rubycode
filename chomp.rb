puts("Type in your name!")

name = gets.chomp

puts("Hello " + name +"!")

num = gets.to_i

if num <10 
   puts("Number " + num.to_s.chomp + " is less than 10") 
end
