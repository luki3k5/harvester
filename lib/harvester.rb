require "harvester/helper"
require 'mechanize'
require 'json'

module Harvester
  extend self
  
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
  
  # Merthod obtain Map JSON feed with the central point of the currently selected planet (default main planet)
  # 
  #
  def self.get_map_data
    data = get_json_data
    id_planet = data["current_planet"]["id_planet"]
    id_system = data["current_planet"]["id_System"]    
    
    response = @agent.post("http://u1.imperion.com/map/index/preload/", 'planetId' => id_planet, 'systemId' => id_system)
    JSON.parse(response)
  end
  
  def self.login
    @agent = Mechanize.new
    @agent.user_agent_alias = 'Mac Safari' 
    @agent.get(Harvester.configuration.universe_url) and random_pause
    @agent.post(Harvester.configuration.universe_url, 'login[name]' => Harvester.configuration.login, 'login[password]' => Harvester.configuration.password)
  end
    
end

require "harvester/version"
require "harvester/configuration"
