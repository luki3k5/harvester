require 'spec_helper'

describe "Harvester", "when first created" do
  
  it "should have random_pause method" do
    Harvester.should respond_to(:random_pause)
  end

  it "should have login method" do
    Harvester.should respond_to(:login)
  end

  it "should have start method" do
    Harvester.should respond_to(:start)
  end
  
  it "random_pause method should render numbers 2-4 " do
    number = Harvester.random_pause 
    number.should <= 4
    number.should >= 2
  end
  
  
  
end