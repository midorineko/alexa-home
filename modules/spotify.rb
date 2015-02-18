require 'rspotify'
require_relative './spot_search.rb'

def process_spotify(command)
  RSpotify.authenticate("edc6b110ccfb40f68390945a1ed88b73", "c355cfe898f8471e84966da16772be1e")
  words = command.split(" ")
  spot = Appscript.app("spotify.app")
  p '=============================================================='
  p words
  p '=============================================================='
  if command.scan(/random/).length > 0
    track_name = words.drop(4)
  else
    track_name = words.drop(3)
  end

  track_name.pop
  search_track = track_name.join(" ")
  if command.scan(/run/).length > 0
    play_pause()
  elsif command.scan(/off/).length > 0
      if command.scan(/complete/).length > 0
        spot.stop
      else
        spot.pause
      end
    stop()
  end

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
    next_song(rand_track, top_tracks, "random")
  elsif command.scan(/album/).length > 0
    albums = RSpotify::Album.search(search_track)
    album = albums.first
    tracks = album.tracks
    if command.scan(/random/).length > 0
      rand_track = tracks.sample
      next_song(rand_track, tracks, "random")
    else
      first_track = tracks.first
      next_song(first_track, tracks, 0)
    end
  elsif command.scan(/style/).length > 0
    playlists = RSpotify::Playlist.search(search_track)
    playlist = playlists.sample
    play_tracks = playlist.tracks
    rand_track = playlist.tracks.sample
    next_song(rand_track, play_tracks, "random")
  end

end