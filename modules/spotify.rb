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
    p "here in the stop spot"
    spot.pause
  elsif command.scan(/next/).length > 0
    p "here in the next spot"
    spot.next_track
  elsif command.scan(/back/).length > 0
    p "here in the last spot"
    spot.back_track
  end

  if command.scan(/inspect/).length > 0
    if command.scan(/track/).length > 0
      track_name = words.drop(4)
      track_name.pop
      search_track = track_name.join(" ")
      p search_track
      tracks = RSpotify::Track.search(search_track)
      first_track = tracks.first.inspect
      uri = first_track[/spotify\:track.*/]
      uri = uri[0..-3]
      spot.open_location uri
    end
  end

end