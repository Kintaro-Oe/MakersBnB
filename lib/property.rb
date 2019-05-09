require 'pg'

class Property
  attr_reader :id, :user_id, :property_name, :price, :available_dates, :description

  def initialize(id:, user_id:, property_name:, price:, available_dates:, description:)
    @id = id
    @user_id = user_id
    @property_name = property_name
    @price = price
    @available_dates = available_dates
    @description = description
  end

  def self.add_listing(user_id:, property_name:, price:, available_dates:, description:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect dbname: "bnb_test"
    else
      connection = PG.connect dbname: "bnb"
    end

    result = connection.exec(
      "INSERT INTO properties (user_id, property_name, price, available_dates, description) VALUES ('#{user_id}', '#{property_name}', #{price}, '#{available_dates}', '#{description}')
      RETURNING id, user_id, property_name, price, available_dates, description;"
    )
    Property.new(id: result[0]['id'], user_id: result[0]['user_id'], property_name: result[0]['property_name'], price: result[0]['price'], available_dates: result[0]['available_dates'], description: result[0]['description'])
  end

  def self.retrieve_listing
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect dbname: "bnb_test"
    else
      connection = PG.connect dbname: "bnb"
    end

    result = connection.exec("SELECT id, user_id, property_name, price, available_dates, description FROM properties;")
    result.map do |property| Property.new(
      id: property['id'], user_id: property['user_id'],
      property_name: property['property_name'], price: property['price'],
      available_dates: Date.parse(property['available_dates']),
      description: property['description']
    )
    end
  end
end
