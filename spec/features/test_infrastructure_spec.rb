feature 'Test infrastructure' do
  scenario 'has homepage' do
    visit '/'
    expect(page).to have_content("Ruby n B")
  end
end
