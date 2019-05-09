require 'sinatra/base'
require_relative 'lib/user'
require_relative 'lib/property'

class BnB < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/register' do
    erb :register
  end

  post '/users' do
    user = User.create(first_name: params[:first_name], surname: params[:surname], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    session[:first_name] = user.first_name
    redirect '/home'
  end

  get '/home' do
    @first_name = session[:first_name]
    @properties = Property.retrieve_listing
    erb :home
  end

  get '/add_listing' do
    erb :add_listing
  end

  post '/add_listing' do
    Property.add_listing(
      user_id: session[:user_id],
      property_name: params[:property_name],
      price: params[:price],
      available_dates: params[:available_dates],
      description: params[:description]
    )
    redirect '/home'
  end

  run! if app_file == $0
end
