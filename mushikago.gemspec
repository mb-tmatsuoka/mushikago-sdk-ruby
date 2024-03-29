$:.push File.expand_path("../lib", __FILE__)
require "mushikago/version"

Gem::Specification.new do |s|
  s.name        = "mushikago-sdk"
  s.version     = Mushikago::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Toru Matsuoka"]
  s.email       = ["t.matsuoka@miningbrownie.co.jp"]
  s.homepage    = "http://www.mushikago.org/"
  s.summary     = %q{Mushikago SDK for Ruby}
  s.description = %q{A SDK for Mushikago Web Service.}

  s.add_runtime_dependency 'json'
  s.add_runtime_dependency 'mime-types'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'maruku'
  s.add_development_dependency 'yard'
  s.add_development_dependency 'rspec', '~> 2.6.0'
  s.add_development_dependency 'ci_reporter'
  s.add_development_dependency 'ZenTest'
  s.add_development_dependency 'bundler'

  s.files         = `find autotest/ lib/ spec/`.split("\n")
  s.files        += %w(LICENSE README.md Rakefile Gemfile)
  s.files.reject!{|fn| fn.include?('spec/report') }
  s.test_files    = `find spec -name '*.rb'`.split("\n")
  s.require_paths = ["lib"]
end
