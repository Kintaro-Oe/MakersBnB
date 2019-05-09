feature 'Users can create new listings' do
  scenario 'details are saved to properties database and displayed' do
    User.create(first_name: 'Steve', surname: 'Jobs', email: 'jobs@world.net', password: 'apple')

    visit '/'
    click_button 'Sign In'
    fill_in(:email, with: 'jobs@world.net')
    fill_in(:password, with: 'apple')
    click_button 'Submit'
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
