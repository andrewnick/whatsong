require 'sinatra'
require_relative 'slack_authoriser'

use SlackAuthorizer

post '/whatsong' do
  'OK'
end