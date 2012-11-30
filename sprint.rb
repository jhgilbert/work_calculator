class Sprint
  attr_accessor :begin_word_count, :length, :end_word_count, :profit, 
  :time_remaining
  
  def initialize
    puts "What is your starting point?"
    @begin_word_count = gets.to_f
    puts "How long of a sprint would you like, in minutes?"
    @length = gets.to_i
    @time_remaining = @length * 60
  end
  
  def countdown
    loop do
      sleep(300) #needs to be 300, any deviation is just for testing
      @time_remaining = @time_remaining - 300
      system("say '#{@time_remaining} minutes remaining.'")
      break if @time_remaining == 0
    end
  end
  
end 