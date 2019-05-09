require 'property'

describe Property do
  describe '#add_listing' do
    it 'creates a new property listing' do
    connection = PG.connect dbname: "bnb_test"
    property = Property.add_listing(user_id: '109', property_name: "Casa alla Dave", price: 100.99, available_dates: Date.today, description: "fancy")
    expect(property.property_name).to eq "Casa alla Dave"
    end
  end
end
