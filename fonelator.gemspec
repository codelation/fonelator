$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "fonelator/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "fonelator"
  s.version     = Fonelator::VERSION
  s.authors     = ["Matthew Sullivan", "Brian Pattison"]
  s.email       = ["msull92@gmail.com", "brian@brianpattison.com"]
  s.homepage    = "http://github.com/81designs/fonelator"
  s.summary     = "An automated phone answering brain."
  s.description = "An automated phone answering brain."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.3"
  s.add_dependency "cancan"
  s.add_dependency "jquery-rails"
  s.add_dependency "jquery-ui-rails"
  s.add_dependency "rails3-jquery-autocomplete"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "devise"
end
