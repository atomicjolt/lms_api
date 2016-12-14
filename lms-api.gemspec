$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "lms/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "lms-api"
  s.version     = LMS::VERSION
  s.authors     = ["Atomic Jolt", "Jamis Buck", "Justin Ball"]
  s.email       = ["jamis@jamisbuck.org", "justin.ball@atomicjolt.com"]
  s.homepage    = "https://github.com/atomicjolt/lms_api"
  s.summary     = "Wrapper for the Instructure Canvas API"
  s.description = "Wrapper for the Instructure Canvas API"
  s.license     = "MIT"

  s.required_ruby_version = ">= 2.0"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "activesupport", ">=3.0"
  s.add_dependency "httparty"

  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "webmock"
end
