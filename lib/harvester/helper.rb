module Harvester
  
    # this method makes sure we pause for random number of seconds
    # it will be used to simulate people's slownes in clicking 
    def self.random_pause
      sleep(rand(2)+2) # longest is 4 seconds, shortest 2 second 
    end
  
end