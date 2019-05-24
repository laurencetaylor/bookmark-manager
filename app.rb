require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :method_override

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:'bookmarks/index')
  end

  get '/bookmarks/add' do
    erb(:'bookmarks/add_url')
  end

  post '/bookmarks/add' do
    Bookmark.add(url: params[:add_url], title: params[:add_title])
    redirect('/bookmarks')
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect('/bookmarks')
  end

  get '/bookmarks/:id/update' do
    @id = params[:id]
    found = Bookmark.find(id: @id)
    @url = found["url"]
    @title = found["title"]
    erb (:'bookmarks/update')
  end

  patch '/bookmarks/:id' do
    p params
    Bookmark.update(id: params[:id], url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
