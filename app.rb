require 'sinatra'
require_relative './app/application.rb'


get '/' do
  @toy_types = ToyTypeController.index
  haml :index
end

get '/toys/:type' do
  @toys = ToyController.index
  haml :toy_list
end
