require 'pg'

def setup_test_database
  p 'resetting test database...'

  connection = PG.connect dbname: "bnb_test"
  connection.exec("TRUNCATE users, properties;")
end
