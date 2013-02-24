ENV['RACK_ENV'] = 'test'

require 'simplecov'
SimpleCov.start

require File.join(File.dirname(__FILE__), '..', 'toy_tracker.rb')

require 'sinatra'
require 'sinatra/base'
require 'rspec'
require 'rack/test'
require 'factory_girl'
require 'database_cleaner'

Sinatra::Base.set :environment, :test
Sinatra::Base.set :run, false
Sinatra::Base.set :raise_errors, true
Sinatra::Base.set :logging, false

FactoryGirl.find_definitions

def app
  @app ||= ToyTracker.new
end

RSpec.configure do |config|
  config.include Rack::Test::Methods

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
