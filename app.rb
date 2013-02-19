require 'sinatra'
require_relative './app/controllers/toy_controller'

get '/' do
  haml :index
end

get '/toys/:type' do
  @toys = ToyController.index
  haml :toy_list
end
