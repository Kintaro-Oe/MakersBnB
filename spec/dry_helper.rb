require_relative '../lib/user'
require_relative '../lib/property'

def create_user_sign_in
 User.create(first_name: 'Steve', surname: 'Jobs', email: 'jobs@world.net', password: 'apple')
 visit '/'
 click_button 'Sign In'
 fill_in(:email, with: 'jobs@world.net')
 fill_in(:password, with: 'apple')
 click_button 'Submit'
end

def populate_properties
  connection = PG.connect dbname: "bnb_test"
  property = Property.add_listing(user_id: '109', property_name: "Casa alla Dave", price: 100.99, available_dates: Date.today, description: "fancy")
end
