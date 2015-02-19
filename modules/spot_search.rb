def play_pause()
  Appscript.app("spotify.app").play
  if $STARTER #start time should break cause it is in the class
    elapsed_time_seconds = $ENDER - $STARTER #start time should break cause it is in the class
    sleep $SONG_DURATION - elapsed_time_seconds.round(2)
    #calculating the amount of time the song played for before pausing
    post_track = Playback.new
    $FIRST_TRACK = post_track
    if $SONG_INT == "random"
      track = $TRACK_QUE.shuffle.pop
      post_track.next_song(track, $TRACK_QUE, "random")
    else
      $SONG_INT = $SONG_INT + 1   #hopefully i break here for having an unintialized class variable
      track = $TRACK_QUE[$SONG_INT]
      post_track.next_song(track, $TRACK_QUE, $SONG_INT)
    end
  end
end

def stop()
  $ENDER = Time.now
  $FIRST_TRACK.finished()
end

class Playback
  require 'rspotify'

  def initialize()
    @track = 'track'
    @stop = false
  end

  def finished()
    @stop = true
  end

  def next_song(current_track, possible_tracks, i)#plays the current song and gets the next
    @track = current_track
    $TRACK_QUE = possible_tracks
      spot = Appscript.app("spotify.app")
      uri = current_track.instance_variable_get('@uri')
      spot.open_location uri #this actualy plays the track
      ms = current_track.instance_variable_get('@duration_ms')
      $SONG_INT = i
      $STARTER = Time.now
      timer = ms / 60000.to_f
      $SONG_DURATION = timer.round(2) * 60
    # @@song_duration_seconds = 10
      sleep $SONG_DURATION
    if @stop == true
        return
    elsif i == "random"
      finished() #will stop pre_track and post_track from randomly continuing
      post_track = Playback.new
      $FIRST_TRACK = post_track
      rand_track = $TRACK_QUE.shuffle.sample
      post_track.next_song(rand_track, $TRACK_QUE, "random")
    else
      finished() #will stop pre_track and post_track from randomly continuing
      post_track = Playback.new
      $FIRST_TRACK = post_track
      $SONG_INT = $SONG_INT + 1 #have to increase the integer
      next_track = $TRACK_QUE[$SONG_INT]
      if $SONG_INT > $TRACK_QUE.length
        return
      end
      post_track.next_song(next_track, $TRACK_QUE, $SONG_INT)
    end
  end

end