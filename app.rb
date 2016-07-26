require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pg'

# Load the file to connect to the DB
require_relative 'db/connection'

# Load models
require_relative 'models/artist'
require_relative 'models/song'

get '/'do
  redirect '/artists'
end

get '/artists' do
  @artists = Artist.all
  erb :"artists/index"
end

# whatever id is in the url, we should be able to find this artist
# made a show erb, then came Here
get '/artists/:id' do
  @artist = Artist.find(params[:id])
  erb :"artists/show"
end
