feature 'Users can approve bookings' do
  scenario 'booking requests can be approved or denied ' do
    create_user_sign_in
    click_button "Add new listing"
    fill_in 'property_name', with: 'Casa alla Steve'
    fill_in 'price', with: 100.99
    fill_in 'available_dates', with: Date.today
    fill_in 'description', with: 'fancy'
    click_button 'Submit'
    click_button 'Sign Out'

    create_dave_sign_in
    click_button "Casa alla Steve"
    click_link "Go back to main"
    click_button "Browse listings"
    click_button 'Sign Out'

    click_button 'Sign In'
    fill_in(:email, with: 'jobs@world.net')
    fill_in(:password, with: 'apple')
    click_button 'Submit'

    click_button 'Manage your properties'


    expect(page).to have_content('Casa alla Steve')
 end
end
