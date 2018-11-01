require 'sinatra'
require_relative 'app/slack_authorizer'

use SlackAuthorizer

post '/whatsong' do
  "OK"
end