feature 'Non system user can register' do
  scenario 'new users details are saved to database' do
    visit '/'
    click_button "Sign Up"
    fill_in "first_name", with: "Dave"
    fill_in "surname", with: "Jones"
    fill_in "email", with: "Email"
    fill_in "password", with: "Password"
    click_button "Submit"
    expect(page).to have_content("Welcome Dave")
  end
end
