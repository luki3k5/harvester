# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "harvester/version"

Gem::Specification.new do |s|
  s.name        = "harvester"
  s.version     = Harvester::VERSION
  s.authors     = ["krzysdb, luki3k5"]
  s.email       = ["krzysdb@gmail.com, luki3k5@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{This gem is to automate certain actions in imperion game}
  s.description = %q{This gem is to automate certain actions in imperion game}

  s.add_dependency('yaml')
  s.add_dependency('json')
  s.add_dependency('nokogiri')
  s.add_dependency('mechanize')
  s.add_development_dependency "rspec" # this for development only and it will install rspec so we can write tests 
  
  s.rubyforge_project = "harvester"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
