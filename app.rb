require 'sinatra/base'

class BnB < Sinatra::Base
  get '/' do
    'Ruby n B'
  end

  run! if app_file == $0
end
