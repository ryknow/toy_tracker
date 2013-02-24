require 'sinatra'
require 'sinatra/base'
require 'mongoid'

# Require all models
Dir['./models/*.rb'].each {|file| require file }

# Load mongoid configuration
Mongoid.load!("./config/mongoid.yml")


class ToyTracker < Sinatra::Base
  get '/' do
    haml :index, :locals => {:toy_types => ToyType.all}
  end

  get '/toys/:type' do
    haml :toy_list, :locals => {:toys => ToyType.where(name: params[:type]).first.toys,
                                :toy_type => params[:type]}
  end

  post '/toys/:type' do
    toy      = Toy.new(name:     params["toy-name"], 
                       material: params["toy-material"],
                       talking:  params["talking"] == "on",
                       size:     params["toy-size"])
    toy_type = ToyType.where(name: params[:type]).first
    toy_type.toys << toy
    toy_type.save!
    redirect to("/toys/#{params[:type]}")
  end

  delete '/toys/:type/:id' do
    # Does nothing yet
  end

  put 'toys/:type/:id' do
    # Does nothing yet
  end
end
