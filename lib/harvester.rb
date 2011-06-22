require 'mechanize'
require 'json'

module Harvester
  
  # @return [Configuration] The configuration singleton.
  def self.configuration
    @configuration ||= Harvester::Configuration.new
  end
  
  def self.has_login_data?
    !Harvester.configuration.login.nil? && !Harvester.configuration.password.nil?
  end
  
  # This is the method that starts the thing
  def self.start    
    if Harvester.has_login_data?
      Harvester.login
    end
  end
  
  # Method obtains JSON data from the page
  #
  # @returns [Hash] with all the data about planets, resources etc
  #
  def self.get_json_data
    JSON.parse(@agent.current_page.body[/var uiData.*;/][/[{].*[}]/]) 
  end
  
  def self.login
    @agent = Mechanize.new
    @agent.user_agent_alias = 'Mac Safari' 
    @agent.get(Harvester.configuration.universe_url)
    sleep 3
    @agent.post(Harvester.configuration.universe_url, 'login[name]' => Harvester.configuration.login, 'login[password]' => Harvester.configuration.password)
  end
    
end

require "harvester/version"
require "harvester/configuration"