

require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require 'dotenv'
Dotenv.load
require './app'

run Sinatra::Application
# run App