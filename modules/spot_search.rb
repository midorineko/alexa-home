require 'rspotify'

def process_inspect(command)
  words = command.split(" ")
  spot = Appscript.app("spotify.app")
  p '=============================================================='
  p words
  p '=============================================================='

    track_name = words.drop(3)
    track_name.pop
    search_track = track_name.join(" ")
    if command.scan(/track/).length > 0
      tracks = RSpotify::Track.search(search_track)
      first_track = tracks.first.inspect
      uri = first_track[/spotify\:track.*/]
      uri = uri[0..-3]
    elsif command.scan(/artist/).length > 0
      artists = RSpotify::Artist.search(search_track)
      art = artists.first
      rand_track = art.top_tracks(:US).sample
      rand_track = rand_track.inspect
      uri = rand_track[/spotify\:track.*/]
      uri = uri[0..-3]
    # elsif command.scan(/style/).length > 0
    #   playlist = RSpotify::Playlist.search(search_track)
    #   play = playlist.first
    #   rand_track = art.top_tracks(:US).sample
    #   rand_track = rand_track.inspect
    #   uri = rand_track[/spotify\:track.*/]
    #   uri = uri[0..-3]
    end
    spot.open_location uri

end