class Harvester::Configuration
  
  DEFAULT_SERVER = "u1.imperion.com"

  attr_accessor :login, :password
  
  def initialize
    @base_url = DEFAULT_SERVER
  end
end