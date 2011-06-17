require 'spec_helper'

describe "Harvester.configuration", "when first created" do
  
  it "should has no login set yet" do
    Harvester.configuration.login.should == nil
  end

  it "should has no password set yet" do
    Harvester.configuration.password.should == nil
  end

  it "we should be able to set login and check it's presence" do
    Harvester.configuration.login = "user_1"
    Harvester.configuration.login.should == "user_1"
  end

  it "we should be able to set password and check it's presence" do
    Harvester.configuration.password = "secret"
    Harvester.configuration.password.should == "secret"
  end
  
end