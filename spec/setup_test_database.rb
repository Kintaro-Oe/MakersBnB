require 'pg'
require 'property'

def setup_test_database
  p 'resetting test database...'

  connection = PG.connect dbname: "bnb_test"
  connection.exec("TRUNCATE users, properties;")
end

# def populate_properties
#   connection = PG.connect dbname: "bnb_test"
#   property = Property.add_listing(user_id: '109', property_name: "Casa alla Dave", price: 100.99, available_dates: Date.today, description: "fancy")
# end
