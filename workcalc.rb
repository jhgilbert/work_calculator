work_summary = []
t = Time.new

loop do
    
  puts "What is your starting point?"
  starting_point = gets.to_f
  
  puts "How long of a sprint would you like, in minutes? (increments of 5)"
  sprint_minutes = gets.to_i
  sprint_seconds = sprint_minutes * 60

  system('say "go"')
  puts "The clock is running..."
  
  loop do
  
  sleep(1) #needs to be 300, any deviation is just for testing
  sprint_seconds = sprint_seconds - 300
  minutes_remaining = sprint_seconds / 60
  puts 7.chr
  puts "#{minutes_remaining} minutes remaining."
  
  break if sprint_seconds == 0
  end
  
  system('say "Time is up."')
  
  puts "Time is up. Where are you now?"
  current_place = gets.to_f

  words_edited = current_place - starting_point

  profit = (words_edited * 0.0104) * 0.66
  puts "You have made $#{"%.2f" % profit} in #{sprint_minutes} minutes."
  
  work_summary << "$#{"%.2f" % profit}"
  work_summary << sprint_minutes
  
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