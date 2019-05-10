require 'dry_helper'

feature 'User can make a booking request ' do
 scenario 'request is saved to database and displayed' do
  populate_properties
  create_user_sign_in
  click_button "Request a booking"
 end
end



feature 'Users can create new listings' do
  scenario 'details are saved to properties database and displayed' do
    create_user_sign_in
    click_button "Add new listing"
    fill_in 'property_name', with: 'Casa alla Dave'
    fill_in 'price', with: 100.99
    fill_in 'available_dates', with: Date.today
    fill_in 'description', with: 'fancy'
    click_button 'Submit'
    expect(page).to have_content('Casa alla Dave')
    expect(page).to have_content('fancy')
    expect(page).to have_content(100.99)
 end
end
