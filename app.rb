# file: app.rb
require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/album_repository'

DatabaseConnection.connect('music_library')

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/album_repository.rb'
  end

  get '/' do
    return 'Hello'
  end

  get '/albums' do
    album_repository = AlbumRepository.new
    @albums = album_repository.all

    return erb(:index)
  end
end