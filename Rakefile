require 'rake'
require 'rake/testtask'
require 'rspec/core/rake_task'
require 'simplecov'

desc "Run all RSpec tests"
RSpec::Core::RakeTask.new(:spec)

task :default => :spec

Dir["#{File.dirname(__FILE__)}/lib/tasks/**/*.rake"].sort.each { |ext| load ext }
