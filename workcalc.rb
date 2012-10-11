include Enumerable

class Array
  def sum
    self.inject{|sum,x| sum + x }
  end
end

work_summary = []
minutes_worked = []
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
  system("say '#{minutes_remaining} minutes remaining.'")
  
  break if sprint_seconds == 0
  end
  
  system('say "Time is up."')
  
  puts "Time is up. Where are you now?"
  current_place = gets.to_f

  words_edited = current_place - starting_point

  profit = (words_edited * 0.0104) * 0.66
  puts "You have made $#{"%.2f" % profit} in #{sprint_minutes} minutes."
  
  work_summary << "$#{"%.2f" % profit}"
  minutes_worked << sprint_minutes
  
  puts "*******"
  puts "Profits by session:"
  print work_summary, "\n"
  
  puts "Sessions so far:"
  print minutes_worked, "\n"
  
  puts "Total minutes worked:"
  print minutes_worked.sum, "\n"
  
  profit_sum = work_summary.dup
  profit_sum.map! do |s| 
    s.delete("$")
  end
  profit_sum.map! do |s|
    s.to_f
  end
  profit_sum = profit_sum.sum
  
  puts "Total profit made:"
  print "$#{"%.2f" % profit_sum}", "\n"
  puts "*******"
  
  puts "Would you like to add a sprint, Y/N?"
  sprint = gets.chomp
  
break if sprint == "N"
end

profit_sum = work_summary.dup
profit_sum.map! do |s| 
  s.delete("$")
end
profit_sum.map! do |s|
  s.to_f
end
profit_sum = profit_sum.sum

print "$#{"%.2f" % profit_sum}", "\n"
puts "Saving to progress log..."
puts "Good-bye."

File.open("progress_log.txt", "a") do |f|
  f.puts t.strftime("%m-%d-%Y")
  f.puts "Session profits:"
  f.print work_summary, "\n"
  f.puts "Session times:"
  f.print minutes_worked, "\n"
  f.puts "Total minutes worked:"
  f.print minutes_worked.sum, "\n"
  f.puts "Total earned:"
  f.print "$#{"%.2f" % profit_sum}", "\n", "\n"
end