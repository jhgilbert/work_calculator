class Sprint
  attr_accessor :starting_point, :length
  
  def initialize
    # gather information about session starting point and length
  end
  
  def countdown
    sprint_seconds = sprint.length_to_i * 60
    loop do
      sleep(300) #needs to be 300, any deviation is just for testing
      sprint_seconds = sprint_seconds - 300
      sprint.length = sprint_seconds / 60
      system("say '#{sprint.length} minutes remaining.'")
      break if sprint_seconds == 0
    end
  end
  
end 