require 'spec_helper'
require 'yaml'

describe "Harvester tests", "when first created" do
  
  before(:all) do
    # we load configuration 
    @config = YAML::load(File.open("./harvester_login_details.yml"))
    raise "!!! harvester_login_details.yml file is missing - have your renamed harvester_login_details.yml.sample into harvester_login_details.yml? !!!" if @config.nil?
    
    # we set configuration up
    Harvester.configuration.login = @config["login"]
    Harvester.configuration.password = @config["password"]    
  end
  
  it "should get proper json back" do
    Harvester.start # logs in
    data = Harvester.get_json_data # gets json
    data["species"].downcase.should == @config["species"].downcase
    data.keys.include?("current_planet").should == true
  end
  
end