require 'sinatra/base'

class BnB < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/register' do
    erb :register
  end

  post '/home' do
    erb :home 
  end

  run! if app_file == $0
end
