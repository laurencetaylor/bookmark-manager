def add_bookmark
  visit '/bookmarks'
  click_button 'Add Bookmark'
  fill_in 'add_url', with: 'http://makers.tech'
  fill_in 'add_title', with: 'Makers'
  click_button 'Submit'
end
