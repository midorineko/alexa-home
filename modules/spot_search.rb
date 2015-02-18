require 'rspotify'

<<<<<<< HEAD
def next_song(current_track, possible_tracks, i)
    #I need to stop this if any command comes in
    spot = Appscript.app("spotify.app")
    uri = current_track.instance_variable_get('@uri')
=======
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
    elsif command.scan(/style/).length > 0
      RSpotify.authenticate("<your_client_id>", "<your_client_secret>")
      playlists = RSpotify::Playlist.search(search_track)
      playlist = playlists.sample
      rand_track = playlist.tracks.sample
      rand_track = rand_track.inspect
      uri = rand_track[/spotify\:track.*/]
      uri = uri[0..-3]
    end
>>>>>>> c44256c159b69cf9b7c4bdb741295553a2edd69e
    spot.open_location uri
    ms = current_track.instance_variable_get('@duration_ms')
    timer = ms / 60000.to_f
    sleep (timer.round(2) * 60)
  if i == "random"
    rand_track = possible_tracks.sample
    next_song(rand_track, possible_tracks, "random")
  else
    i++ #makes 0 to 1 so the next song in the array
    next_track = possible_tracks[i]
    next_song(next_track, possible_tracks, i)
  end
end

<<<<<<< HEAD
=======
end
>>>>>>> c44256c159b69cf9b7c4bdb741295553a2edd69e
