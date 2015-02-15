def process_spotify(command)
  words = command.split(" ")
  p '=============================================================='
  p words
  p '=============================================================='

  if command.scan(/on/).length > 0
    system("open", "spotify.app")
    system("sendKeys", "{SPACE}")
    #this correctly opens a spotify application, or pulls up th already opened application, however I need to hit 'space' to play
  end

end