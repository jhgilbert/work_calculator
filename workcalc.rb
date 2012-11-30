include Enumerable

t = Time.new
profits_array = []
session_lengths = []

loop do
  puts "Would you like to do a sprint? Y/N"
  answer = gets.chomp
  if answer == "Y"
    sprint = Sprint.new
    sprint.start # Asks about current spot in manuscript, length of desired sprint, and starts the clock
    sprint.countdown # Runs the clock down, offering warnings every five minutes
    sprint.debrief # Gathers data about the productivity of the sprint
    profits_array << sprint.profit
    session_lengths << sprint.length
    puts "*******"
    puts "Profits by session:"
    print profits_array, "\n"
  
    puts "Sessions so far:"
    print session_lengths, "\n"
  
    puts "Total minutes worked:"
    print session_lengths.sum, "\n"
  
    profit_sum = profits_array.dup
    profit_sum.map! do |s| 
      s.delete("$")
    end
    profit_sum.map! do |s|
      s.to_f
    end
    profit_sum = profit_sum.sum
  
    puts "Total profit made:"
    print "$#{profit_sum}", "\n"
    puts "*******"
    
    stopping_point = sprint.end_word_count
    
  else 
    puts "Saving session results to progress log ..."
    File.open("progress_log.txt", "a") do |f|
      f.puts t.strftime("%m-%d-%Y")
      f.puts "Session profits:"
      f.print profits_array, "\n"
      f.puts "Session times:"
      f.print session_lengths, "\n"
      f.puts "Total minutes worked:"
      f.print session_lengths.sum, "\n"
      f.puts "Total earned:"
      f.print "$#{profit_sum}", "\n"
      f.puts "Stopping point:"
      f.print stopping_point, "\n", "\n"
    end
    puts "Good-bye."
  end
  break if answer == "N"
end