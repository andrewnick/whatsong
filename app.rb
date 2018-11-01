require 'sinatra'
require 'rspotify'

require_relative 'slack_authoriser'

use SlackAuthorizer

post '/whatsong' do
  'OK'
  artists = RSpotify::Artist.search('Arctic Monkeys')
  arctic_monkeys = artists.first
  arctic_monkeys.genres.join(', ')
end