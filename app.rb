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
  if command.scan(/light|lights/).length > 0
    process_lights(command)
  # NEST #
  elsif command.scan(/temperature|nest/).length > 0
    process_temperature(command)
  elsif command.scan(/river/).length > 0
    process_player(command, player: "iriver")
  elsif command.scan(/spotify/).length > 0
    p "I hear you say spot"
  process_spotify(command)
  elsif command.scan(/itunes/).length > 0
    p "I hear you say tunes"
    process_itunes(command)
  elsif command.scan(/inspect/).length > 0
    p "I hear you say inspec"
    process_inspect(command)
  end
end

get '/command' do
  process_query(params[:q])
end

get '/status' do
  status 200
end
