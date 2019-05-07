require 'user'

describe User do
  describe '#create' do
    it 'creates a new user' do
    connection = PG.connect dbname: "bnb_test"
    user = User.create(first_name: "Dave", surname: "Jones", email: "email", password: "password")
    expect(user.first_name).to eq "Dave"
    end
  end
end
