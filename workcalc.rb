work_summary = []

puts "What is today's date MM.DD.YY?"
log_filename = gets.to_s

loop do
    
  puts "What is your starting point?"
  starting_point = gets.to_f

  system('say "go"')
  puts "The clock is running..."

  sleep(1) #needs to be 1200, this is just for testing

  system('say "Time is up."')

  puts "Time is up. Where are you now?"
  current_place = gets.to_f

  words_edited = current_place - starting_point

  profit = (words_edited * 0.0104) * 0.66
  puts "You have made $#{profit} in 20 minutes."
  
  work_summary << "$#{profit}"
  
  print work_summary, "\n"
  
  puts "Would you like to add a sprint, Y/N?"
  sprint = gets.chomp
  
break if sprint == "N"
end

print work_summary, "\n"
File.open(log_filename, "w") do |f|
  f.print work_summary
end