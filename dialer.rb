require 'Mechanize'

class Dialer
  include User

  def initialize
    @login = User.login
    @password = User.password
    @universe = 'http://' + User.universe
    
  end
  
  def login
    @agent = Mechanize.new
    agent.get(@universe)
    sleep 3
    agent.post(@universe, 'login[name]' => @login, 'login[password]' => @password)
    
    
  end
end
