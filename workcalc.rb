include Enumerable

profits_array = []
session_lengths = []

loop do
  puts "Would you like to do a sprint? Y/N"
  answer = gets.chomp
  if answer == "Y" do
    sprint = Sprint.new
    sprint.start # Asks about current spot in manuscript, length of desired sprint, and starts the clock
    sprint.countdown # Runs the clock down, offering warnings every five minutes
    sprint.debrief # Gathers data about the productivity of the sprint
    profits_array << sprint.profit
    session_lengths << sprint.length
  else "Saving session results to progress log ... good-bye."
  end
  break if answer == "N"
end




OLD CODE--------------------------------------------
# include Enumerable

# class Array
  # def sum
    # self.inject{|sum,x| sum + x }
    # end
# end

# work_summary = []
# minutes_worked = []
# t = Time.new

stopping_point = nil



  
#  system('say "Time is up."')
  
#  puts "Time is up. Where are you now?"
#  current_place = gets.to_f

#  words_edited = current_place - starting_point
  
#  stopping_point = current_place.to_i

#  profit = (words_edited * 0.0104) * 0.66 # value in parens is 0.0104 for most projects, .00324 for QRs
#  puts "You have made $#{"%.2f" % profit} in #{sprint_minutes} minutes."
  
#  work_summary << "$#{"%.2f" % profit}"
#  minutes_worked << sprint_minutes
  
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
  f.print "$#{"%.2f" % profit_sum}", "\n"
  f.puts "Stopping point:"
  f.print stopping_point, "\n", "\n"
end