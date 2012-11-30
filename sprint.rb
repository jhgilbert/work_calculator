class Sprint
  attr_accessor :begin_word_count, :length, :end_word_count, :profit, 
  :time_remaining, :words_edited
  
  def start
    puts "What is your starting point?"
    @begin_word_count = gets.to_f
    puts "How long of a sprint would you like, in minutes?"
    @length = gets.to_i
    @time_remaining = @length * 60
    system('say "go"')
    puts "The clock is running..."
  end
  
  def countdown
    loop do
      sleep(300) #needs to be 300, any deviation is just for testing
      @time_remaining = @time_remaining - 300
      system("say '#{@time_remaining / 60} minutes remaining.'")
      break if @time_remaining == 0
    end
  end
  
  def debrief
    puts "Time is up. Where are you now?"
    @end_word_count = gets.to_f
    @words_edited = @end_word_count - @begin_word_count
    @profit = (@words_edited * 0.0104) * 0.66
    @profit = "%.2f" % @profit
    puts "You have made $#{@profit} in #{@length} minutes."
  end
  
  