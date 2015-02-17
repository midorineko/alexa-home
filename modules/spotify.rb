require 'rspotify'

def process_spotify(command)
  words = command.split(" ")
  spot = Appscript.app("spotify.app")
  p '=============================================================='
  p words
  p '=============================================================='

  if command.scan(/on/).length > 0
    p "here in the spot"
    spot.play
  elsif command.scan(/off/).length > 0
    p "here in the stop pause"
    if command.scan(/complete/).length > 0
      p "here in the stop spot"
      spot.stop
    else
      p "here in the stop pause"
      spot.pause
    end
  elsif command.scan(/next/).length > 0
    p "here in the next spot"
    spot.next_track
  elsif command.scan(/back/).length > 0
    p "here in the last spot"
    spot.back_track
  end
end