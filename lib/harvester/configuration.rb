class Harvester::Configuration
  
  DEFAULT_SERVER = "http://u1.imperion.com"

  attr_accessor :login, :password, :universe_url
  
  def initialize
    @universe_url = DEFAULT_SERVER
  end
end