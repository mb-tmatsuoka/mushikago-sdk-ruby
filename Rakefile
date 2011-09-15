$:.unshift File.expand_path('../lib', __FILE__)
require 'rubygems'
require 'bundler'
Bundler.setup :default, :test, :development

Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
ENV['SPEC_OPTS'] = '--colour'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec
task :default => :spec

begin
  require 'yard'
  YARD_OPTS = ['-m', 'markdown', '-M', 'maruku']
  DOC_FILES = ['lib/**/*.rb', 'README.markdown']
  
  YARD::Rake::YardocTask.new(:doc) do |t|
    t.files   = DOC_FILES
    t.options = YARD_OPTS
  end
  
  namespace :doc do
    YARD::Rake::YardocTask.new(:pages) do |t|
      t.files   = DOC_FILES
      t.options = YARD_OPTS + ['-o', '../mushikago.doc']
    end
  end
rescue LoadError
  puts "You need to install YARD."
end
