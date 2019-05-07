require 'pg'

def setup_test_database
  p "setting up test database..."

  connection = PG.connect dbname: "bnb_test"
  connection.exec("TRUNCATE users;")
end
