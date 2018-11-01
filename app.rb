require 'sinatra'
require 'rspotify'

require_relative 'slack_authoriser'
require_relative 'config/application'

use SlackAuthorizer

post '/whatsong' do
  'OK'
#   artists = RSpotify::Artist.search('Arctic Monkeys')
#   arctic_monkeys = artists.first
#   arctic_monkeys.genres.join(', ')

  me = RSpotify::User.find('1232409408')
  me.recently_played.join(', ')
end