require 'sinatra'
require 'rspec'

Sinatra::Base.set :environment, :test
Sinatra::Base.set :run, false
Sinatra::Base.set :raise_errors, true

require File.join(File.dirname(__FILE__), '../app')

DataMapper.setup(:default, "sqlite3::memory:");

RSpec.configure do |config|
  config.before(:each) { DataMapper.auto_migrate! }
end
