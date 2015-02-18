def play_pause()
  Appscript.app("spotify.app").play
  @stop = false
  if @@start_time
    elapsed_time_seconds = @@stop_time - @@start_time
    sleep @@song_duration_seconds - elapsed_time_seconds.round(2)
    #calculating the amount of time the song played for before pausing
    if @i == "random"
      track = @tracks.shuffle.pop
      next_song(track, @tracks, "random")
    else
      int = @i + 1
      track = @tracks[int]
      next_song(track, @tracks, int)
    end
  end
end

def stop()
  @@stop_time = Time.now
  if @@pre == true
    pre_track.finished()
  else
    post_track.finished()
  end
end

#things before new query get hit before new_query
def new_query()
  @@pre = true
end

class Playback
  require 'rspotify'

  def initialize()
    @track = 'track'
    @tracks = 'tracks'
    @i = 'random'
    @stop = false
  end

  def finished()
    @stop = true
  end

  def next_song(current_track, possible_tracks, i)#plays the current song and gets the next
    @track = current_track
    @tracks = possible_tracks
      spot = Appscript.app("spotify.app")
      uri = current_track.instance_variable_get('@uri')
      spot.open_location uri #this actualy plays the track
      ms = current_track.instance_variable_get('@duration_ms')
      @i = i #set class variable i
      @@start_time = Time.now
      timer = ms / 60000.to_f
      @@song_duration_seconds = timer.round(2) * 60
      sleep @@song_duration_seconds
    if @stop == true
        return
    elsif i == "random"
      post_track = Playback.new
      @@pre = false
      rand_track = possible_tracks.shuffle.pop
      post_track.next_song(rand_track, possible_tracks, "random")
    else
      post_track = Playback.new
      @@pre = false
      int = i + 1 #have to increase the integer
      next_track = possible_tracks[int]
      post_track.next_song(next_track, @tracks, int)
    end
  end

end

