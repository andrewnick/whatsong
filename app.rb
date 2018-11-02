require 'sinatra'
require 'sinatra/base'
require 'sinatra/activerecord'
require 'rspotify'
require 'rspotify/oauth'
require 'omniauth'

# require_relative 'slack_authoriser'
require_relative 'config/application'
require_relative 'models/users'

class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  enable :sessions

  # set :database_file, "path/to/database.yml"

  spotify_scopes = [
    "playlist-read-private",
    "playlist-modify-public",
    "playlist-modify-private",
    "playlist-read-collaborative",
    "user-read-private",
    "user-read-birthdate",
    "user-read-email",
    "user-read-playback-state",
    "user-read-currently-playing",
    "user-modify-playback-state",
    "app-remote-control",
    "streaming",
    "user-follow-modify",
    "user-follow-read",
    "user-top-read",
    "user-read-recently-played",
    "user-library-read",
    "user-library-modify",
  ]

  # use SlackAuthorizer
  use OmniAuth::Builder do
    provider :spotify, ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_CLIENT_SECRET'], scope: spotify_scopes.join(' ')
  end

  post '/whatsong' do
    # 'OK'
    self.currently_playing_details
  end

  get '/auth/spotify/callback' do
      spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
      @user = User.new
      @user.spotify_hash = spotify_user.to_hash
      @user.save!

      erb :dbTest
  end

  get "/" do
    @current_track = self.currently_playing_details
    erb :dbTest
  end

  def currently_playing_details
    @user = User.first
    me = RSpotify::User.new(@user.spotify_hash)

    currently_playing = me.player.currently_playing

    track_name = "Track: #{currently_playing.name}"
    album = "Album: #{currently_playing.album.name}"
    artists = "Artists: "
    artist_names = currently_playing.artists.map {|artist| artist.name}

    "#{track_name} #{album} Artists: #{artist_names.join(', ')}"
  end
end