$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "i18nize/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "i18nize"
  s.version     = I18nize::VERSION
  s.authors     = ["txemagon / imasen"]
  s.email       = ["txema.gonz@gmail.com"]
  s.homepage    = "https://github.com/txemagon/i18nize"
  s.summary     = "Generate Rails scaffolding with locale using gender."
  s.description = " i18nize provides Rails generators for scaffolding with internationalization incorporated. This translation takes gender into account."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.3"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "guard-spork"

end
