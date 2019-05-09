require 'property'

describe Property do
  describe '#add_listing' do
    it 'creates a new property listing' do
      connection = PG.connect dbname: "bnb_test"
      property = Property.add_listing(user_id: '109', property_name: "Casa alla Dave", price: 100.99, available_dates: Date.today, description: "fancy")
      expect(property.property_name).to eq "Casa alla Dave"
    end
  end

  describe '#retrieve_listing' do
    it 'displays the property listing' do
      connection = PG.connect dbname: "bnb_test"
      Property.add_listing(user_id: '109', property_name: "Casa alla Dave", price: 100.99, available_dates: Date.today, description: "fancy")
      p property = Property.retrieve_listing
      expect(property.first.property_name).to eq("Casa alla Dave")
      expect(property.first.price.to_f).to eq(100.99)
      expect(property.first.description).to eq("fancy")
    end
  end
end
