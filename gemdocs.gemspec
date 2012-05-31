$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "gemdocs/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "gemdocs"
  s.version     = Gemdocs::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Gemdocs."
  s.description = "TODO: Description of Gemdocs."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.3"
  s.add_dependency "yard"
  s.add_development_dependency "sqlite3"
end
