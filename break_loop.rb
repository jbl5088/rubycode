def break_loop() 
  puts("please type GIZMO")
  
  while true
    input = gets.chomp
    if input == "GIZMO"
      break
    end
  end

end

break_loop()
puts("Thank For Typing GIZMO")

