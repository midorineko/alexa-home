require 'sinatra'

require './helpers'

require './modules/lights'
require './modules/temperature'
require './modules/iRiver_player'
require './modules/spotify'

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
  elsif command.scan(/spot/).length > 0
  process_spotify(command)
end

get '/command' do
  process_query(params[:q])
end

get '/status' do
  status 200
end
