require 'rspotify/oauth'

configure do
    # enable :sessions

    OmniAuth::Builder do
        provider :spotify, ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_CLIENT_SECRET'], scope: 'user-read-email playlist-modify-public user-library-read user-library-modify user-read-playback-state user-read-currently-playing'
    end
end