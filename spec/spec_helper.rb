ENV['RACK_ENV'] = 'test'

require 'simplecov'
SimpleCov.start

require File.join(File.dirname(__FILE__), '..', 'toy_tracker.rb')

require 'sinatra'
require 'rspec'
require 'rack/test'

Sinatra::Base.set :environment, :test
Sinatra::Base.set :run, false
Sinatra::Base.set :raise_errors, true
Sinatra::Base.set :logging, false

def app
  Sinatra::Application
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
end
