feature 'authentication' do
  scenario 'user gets error message if email is wrong' do
    visit '/sign_in'
    fill_in(:email, with: 'scotthall@hotemail.com')
    fill_in(:password, with: 'rubynb')
    click_button 'Submit'
    expect(page).to have_content 'Please check your email or password'
  end
end

feature 'authentication' do
  scenario 'user gets error message if password is wrong' do
    User.create(first_name: 'Steve', surname: 'Jobs', email: 'jobs@world.net', password: 'apple')

    visit '/sign_in'
    fill_in(:email, with: 'jobs@world.net')
    fill_in(:password, with: 'samsung')
    click_button 'Submit'
    expect(page).to have_content 'Please check your email or password'
  end
end

feature 'authentication' do
  scenario 'user can log out' do
    User.create(first_name: 'Steve', surname: 'Jobs', email: 'jobs@world.net', password: 'apple')

    visit '/sign_in'
    fill_in(:email, with: 'jobs@world.net')
    fill_in(:password, with: 'apple')
    click_button 'Submit'
    click_button 'Sign Out'
    expect(page).not_to have_content 'Welcome Steve!'
    expect(page).to have_content 'Ruby n B'
  end
end
