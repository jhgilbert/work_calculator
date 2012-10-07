work_summary = []
t = Time.new

loop do
    
  puts "What is your starting point?"
  starting_point = gets.to_f

  system('say "go"')
  puts "The clock is running..."
  
  sleep(300) #needs to be 300, any deviation is just for testing
  
  system('say "Twenty-five remaining."')
  
  sleep(300) #needs to be 300, any deviation is just for testing
  
  system('say "Twenty remaining."')

  sleep(300) #needs to be 300, any deviation is just for testing
  
  system('say "Fifteen remaining."')
  
  sleep(300) #needs to be 300, any deviation is just for testing
  
  system('say "Ten remaining."')
  
  sleep(300) #needs to be 300, any deviation is just for testing
  
  system('say "Five remaining."')
  
  sleep(300) #needs to be 300, any deviation is just for testing
  
  system('say "Time is up."')
  
  puts "Time is up. Where are you now?"
  current_place = gets.to_f

  words_edited = current_place - starting_point

  profit = (words_edited * 0.0104) * 0.66
  puts "You have made $#{"%.2f" % profit} in 30 minutes."
  
  work_summary << "$#{"%.2f" % profit}"
  
  print work_summary, "\n"
  
  puts "Would you like to add a sprint, Y/N?"
  sprint = gets.chomp
  
break if sprint == "N"
end

print work_summary, "\n"
File.open("progress_log.txt", "a") do |f|
  f.puts t.strftime("%m-%d-%Y")
  f.print work_summary, "\n"
end