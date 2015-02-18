require 'rspotify'


def play_pause()
  Appscript.app("spotify.app").play
  if @@start_time
    elapsed_time_seconds = @@stop_time - @@start_time
    sleep @@song_duration_seconds - elapsed_time_seconds.round(2)
    #calculating the amount of time the song played for before pausing
    next_song(@@track, @@tracks, @@i)
  end
end

def stop()
  @@stop_time = Time.now
  @@stop = true
end

def next_song(current_track, possible_tracks, i)#plays the current song and gets the next
    @@track = current_track
    @@tracks = possible_tracks
    spot = Appscript.app("spotify.app")
    uri = current_track.instance_variable_get('@uri')
    spot.open_location uri #this actualy plays the track
    ms = current_track.instance_variable_get('@duration_ms')
    @@i = i++ #have to increase the integer
    @@start_time = Time.now
    timer = ms / 60000.to_f
    @@song_duration_seconds = timer.round(2) * 60
    sleep @@song_duration_seconds
  if @@stop == true
    return
  elsif i == "random"
    rand_track = possible_tracks.shuffle.pop
    next_song(rand_track, possible_tracks, "random")
  else
    int = i + 1 #makes 0 to 1 so the next song in the array
    next_track = possible_tracks[int]
    next_song(next_track, @@tracks, int)
  end
end

