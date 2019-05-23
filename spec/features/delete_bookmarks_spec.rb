feature 'deleting a bookmark' do
  scenario 'should delete a bookmark' do
    add_bookmark
    click_button 'Delete'
    expect(page).not_to have_link('Makers', href: 'http://makers.tech')
  end
end
