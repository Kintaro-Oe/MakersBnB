feature 'Users can create new listings' do
  scenario 'details are saved to properties database and retrieved' do
    visit '/'
    click_button 'Sign Up'
    click_button 'Submit'
    click_button "Add new listing"
    fill_in 'property_name', with: 'property_name'
    fill_in 'price', with: 10.99
    fill_in 'available_dates', with: Date.today
    fill_in 'description', with: 'description'
    click_button 'Submit'
    expect(page).to have_content('property_name')
    expect(page).to have_content('description')
 end
end
