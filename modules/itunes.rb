def process_itunes(command)
  words = command.split(" ")
  itu = Appscript.app("iTunes.app")
  p '=============================================================='
  p words
  p '=============================================================='

  if command.scan(/on/).length > 0
    p "here in the tunes"
    itu.play
  elsif command.scan(/off/).length > 0
    if command.scan(/complete/).length > 0
      p "here in the stop spot"
      itu.stop
    else
      p "here in the stop pause"
      itu.pause
    end
  elsif command.scan(/next/).length > 0
    p "here in the next tunes"
    itu.next_track
  elsif command.scan(/back/).length > 0
    p "here in the back tunes"
    itu.back_track
  end

end