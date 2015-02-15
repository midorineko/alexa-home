def process_itunes(command)
  words = command.split(" ")
  p '=============================================================='
  p words
  p '=============================================================='

  if command.scan(/on/).length > 0
    p "here in the tunes"
    osax = OSAX.osax
    itu = Appscript.app("iTunes.app")
    itu.play
  end

end