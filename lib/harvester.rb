require 'mechanize'

module Harvester
  # @return [Configuration] The configuration singleton.
  def self.configuration
    @configuration ||= Harvester::Configuration.new
  end
  
  def self.has_login_data?
    !Harverster.configuration.login.nil? && !Harverster.configuration.password.nil?
  end
  
  # This is the method that starts the thing
  def self.start
    if Harvester.has_login_data?
      Harvester.login
    end
  end
  
  def self.login
    agent = Mechanize.new
    agent.get(@universe)
    sleep 3
    agent.post(@universe, 'login[name]' => Harvester.configuration.login, 'login[password]' => Harvester.configuration.password)
  end
    
end

require "harvester/version"
require "harvester/configuration"