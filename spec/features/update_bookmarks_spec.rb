feature 'clicking the update button' do
  scenario 'updates bookmark information' do
    add_bookmark
    click_button('Update')
    expect(page).to have_field('update url')
  end
end
