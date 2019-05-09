require './lib/database_connection'

if ENV['RACK_ENV'] == 'test'
DatabaseConnection.setup('bnb_test')
else
DatabaseConnection.setup('bnb')
end
