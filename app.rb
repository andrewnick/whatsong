require 'sinatra'
require_relative 'auth/slack_authorizer'

use SlackAuthorizer

post '/whatsong' do
  'OK'
end