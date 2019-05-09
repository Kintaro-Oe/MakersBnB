require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a databse through PG' do
      expect(PG).to receive(:connect).with(dbname: 'bnb_test')

      DatabaseConnection.setup('bnb_test')
    end

    it 'this connection is persistent' do
      connection = DatabaseConnection.setup('bnb_test')

      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe '.query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('bnb_test')

      expect(connection).to receive(:exec).with("SELECT * FROM users;")
      DatabaseConnection.query("SELECT * FROM users;")
    end
  end
end
