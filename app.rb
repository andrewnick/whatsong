require 'sinatra'
require 'rspotify'
require 'rspotify/oauth'
require 'omniauth'

require_relative 'slack_authoriser'
# require_relative 'config/initializers/omniauth'
require_relative 'config/application'


# use SlackAuthorizer
enable :sessions
use OmniAuth::Builder do
    provider :spotify, ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_CLIENT_SECRET'], scope: 'user-read-email playlist-modify-public user-library-read user-library-modify user-read-playback-state user-read-currently-playing'
end

post '/whatsong' do
  'OK'
#   artists = RSpotify::Artist.search('Arctic Monkeys')
#   arctic_monkeys = artists.first
#   arctic_monkeys.genres.join(', ')
    user_hash = File.read("userfile")
    # me = RSpotify::User.find('1232409408')
    me = RSpotify::User.new(user_hash)
    me.recently_played.join(', ')
end

get '/auth/spotify/callback' do 
    request.env['omniauth.auth']
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    hash = spotify_user.to_hash
    File.open(userfile, 'w') { |file| file.write(hash) }
end