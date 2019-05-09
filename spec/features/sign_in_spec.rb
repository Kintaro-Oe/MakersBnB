feature 'A system user can sign in' do
  scenario 'Users can sign in with their ID and password' do
    User.create(first_name: 'Steve', surname: 'Jobs', email: 'jobs@world.net', password: 'apple')

    visit '/'
    click_button "Sign In"
    fill_in :email, with: "jobs@world.net"
    fill_in :password, with: "apple"
    click_button "Submit"
    expect(page).to have_content("Welcome Steve")
  end
end
