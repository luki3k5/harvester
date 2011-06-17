module User

  def initialize
    if FileTest.exist?("user.properties")==false
      raise "User.properties file doesn't exists"
    end
    
    @properties = Hash.new
    File.open("user.properties").each do |line|
      a,b = line.split(/=/)
      @properties[a] = b
    end
    
  end
  
  def login
    @properties['login']
  end
  
  def password
    @properties['password']
  end
  
  def universe
    @properties['universe']
  end
  
end
