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

  get '/toys/:type/toy-search' do
    toys = ToyType.where(name: params[:type]).first.toys.any_of({name: /#{params[:search_text]}/}, {description: /#{params[:search_text]}/})
    puts "TOYS COUNT: #{toys.count}"    
    haml :toy_list, :locals => {:toys => toys,
                                :toy_type => params[:type]}
  end

  post '/toys/:type' do
    # TODO: Validate uniqueness of combination of name and description for a toy
    toy = Toy.new(params)
    toy_type = ToyType.where(name: params[:type]).first
    toy_type.toys << toy
    if toy_type.save!
      redirect to("/toys/#{params[:type]}")
    else
      status 400
    end
  end

  delete '/toys/:type/:id' do
    toy      = Toy.find(params[:id])
    toy_type = ToyType.where(name: params[:type]).first
    toy_type.toys.delete(toy)
  end

  put 'toys/:type/:id' do
    toy_type = ToyType.where(name: params[:type]).first
    toy      = toy_type.toys.find(params[:id])
    toy.update_attributes!(params)
  end
end
