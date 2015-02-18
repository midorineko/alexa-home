require 'sinatra'

require './helpers'
require 'rspotify'

require 'appscript'
require 'osax'

require './modules/spotify'
require './modules/itunes'
require './modules/spot_search'

require 'numbers_in_words'
require 'numbers_in_words/duck_punch'

def process_query(command)
  # HUE LIGHTS #
  if command.scan(/inspect/).length > 0
    p "I hear you say spotify"
    process_spotify(command)
  elsif command.scan(/itunes/).length > 0
    p "I hear you say itunes"
    process_itunes(command)
  end
end

get '/command' do
  process_query(params[:q])
end

get '/status' do
  status 200
end
