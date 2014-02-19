$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "fonelator/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "fonelator"
  s.version     = Fonelator::VERSION
  s.authors     = ["Matthew Sullivan"]
  s.email       = ["msull92@gmail.com"]
  s.homepage    = "http://github.com/81designs/fonelator"
  s.summary     = "An automated phone answering brain."
  s.description = "An automated phone answering brain."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.3"
  s.add_dependency "twilio-ruby", "3.11.5"
end
