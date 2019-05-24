feature 'clicking the update button' do
  scenario 'should have form to update' do
    add_bookmark
    click_button('Update')
    expect(page).to have_field('url')
    expect(page).to have_field('title')
  end

  scenario 'should update bookmark' do
    add_bookmark
    click_button('Update')
    fill_in('url', with: 'http://google.com')
    fill_in('title', with: 'Google')
    click_button 'Update'
    expect(page).to have_link('Google', href: 'http://google.com')
  end
end
