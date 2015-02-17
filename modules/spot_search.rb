require 'rspotify'

def next_song(current_track, possible_tracks)
    spot = Appscript.app("spotify.app")
    uri = current_track.instance_variable_get('@uri')
    spot.open_location uri
    ms = current_track.instance_variable_get('@duration_ms')
    timer = ms / 60000.to_f
    sleep (timer.round(2) * 60)
    rand_track = possible_tracks.sample
    uri = rand_track.instance_variable_get('@uri')
    spot.open_location uri
    next_song(rand_track, possible_tracks)
end

def process_inspect(command)
  RSpotify.authenticate("edc6b110ccfb40f68390945a1ed88b73", "c355cfe898f8471e84966da16772be1e")
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
      first_track = tracks.first
      uri = first_track.instance_variable_get('@uri')
      spot.open_location uri
    elsif command.scan(/artist/).length > 0
      artists = RSpotify::Artist.search(search_track)
      art = artists.first
      top_tracks = art.top_tracks(:US)
      rand_track = art.top_tracks(:US).sample
      next_song(rand_track, top_tracks)
    elsif command.scan(/style/).length > 0
      playlists = RSpotify::Playlist.search(search_track)
      playlist = playlists.sample
      rand_track = playlist.tracks.sample
      uri = rand_track.instance_variable_get('@uri')
      spot.open_location uri

    end
end