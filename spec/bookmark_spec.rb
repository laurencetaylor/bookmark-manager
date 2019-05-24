require 'bookmark'
require 'database_helpers'

describe Bookmark do
  describe '#all' do
    it 'returns all bookmarks' do
      bookmark = Bookmark.add(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmark.add(url: "http://google.com", title: "Google")
      Bookmark.add(url: "http://twitter.com", title: "Twitter")

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.id).to eq bookmark.id
    end
  end

  describe '#add' do
    it 'adds a new bookmark' do
      bookmark = Bookmark.add(url: 'https://en.wikipedia.org/wiki/Database', title: 'Wiki Database')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'Wiki Database'
      expect(bookmark.url).to eq 'https://en.wikipedia.org/wiki/Database'
    end
  end

  describe '#delete' do
    it 'deletes a bookmark' do
      bookmark = Bookmark.add(url: 'https://en.wikipedia.org/wiki/Database', title: 'Wiki Database')
      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all).to be_empty
    end
  end

  describe '#find' do
    it 'finds a bookmark' do
    bookmark = Bookmark.add(url: 'https://en.wikipedia.org/wiki/Database', title: 'Wiki Database')
    found = Bookmark.find(id: bookmark.id)
    expect(found).to eq ({ "url" => 'https://en.wikipedia.org/wiki/Database', "title" => 'Wiki Database' })
    end
  end

  describe '#update' do
    it 'updates a bookmark' do
      bookmark = Bookmark.add(url: 'https://en.wikipedia.org/wiki/Database', title: 'Wiki Database')
      Bookmark.update(id: bookmark.id, url: 'http://google.com', title: 'Google')
      updated_bookmark = Bookmark.find(id: bookmark.id)
      expect(updated_bookmark['url']).to eq 'http://google.com'
      expect(updated_bookmark['title']).to eq 'Google' 
    end
  end
end
