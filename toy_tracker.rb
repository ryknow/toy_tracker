require 'sinatra/base'
require 'mongoid'

# Require all models
Dir['./models/*.rb'].each {|file| require file }

# Load mongoid configuration
Mongoid.load!("./config/mongoid.yml", :development)


class ToyTracker < Sinatra::Base
  get '/' do
    haml :index, :locals => {:toy_types => ToyType.all}
  end

  get '/toys/:type' do
    haml :toy_list, :locals => {:toys => ToyType.where(name: params[:type]).first.toys,
                                :toy_type => params[:type]}
  end

  post 'toys/:type' do
    toy      = Toy.create(params[:toy])
    toy_type = ToyType.where(name: params[:type]).first
    toy_type.toys << toy
    toy_type.save!
    haml :toy_list
  end
end
