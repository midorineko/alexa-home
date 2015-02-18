require 'rspotify'

def next_song(current_track, possible_tracks, i)
    #I need to stop this if any command comes in
    spot = Appscript.app("spotify.app")
    uri = current_track.instance_variable_get('@uri')
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

