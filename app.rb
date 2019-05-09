require 'sinatra/base'
require_relative 'lib/user'
require_relative 'lib/property'
require './database_connection_setup'

class BnB < Sinatra::Base
  enable :sessions

  get '/' do
    @user = session[:user]
    erb :index
  end

  get '/register' do
    erb :register
  end

  get '/sign_in' do
    @user = session[:user]
    @email = session[:email]
    erb :sign_in
  end

  post '/sign_out' do
    session.clear
    redirect '/'
  end

  post '/users' do
    user = User.create(first_name: params[:first_name], surname: params[:surname], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    session[:first_name] = user.first_name
    redirect '/home'
  end

  post '/signed_in_users' do

    user = User.authenticate(email: params[:email], password: params[:password])
      session[:user] = user
      session[:email] = params[:email]

    if user
      session[:user_id] = user.id
      session[:first_name] = user.first_name

      redirect '/home'
    else
      redirect '/sign_in'
    end

    # result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{params[:email]}'")
    # user = User.new(id: result[0]['id'], first_name: result[0]['first_name'], surname: result[0]['surname'], email: result[0]['email'], password: result[0]['password'])
    # session[:user_id] = user.id
    # session[:first_name] = user.first_name
    # redirect '/home'
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
