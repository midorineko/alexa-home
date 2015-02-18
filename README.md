# Alexa Home

Welcome to Alexa Home Midori Style! I lvoe the amazon echo, but the lack of support for applications I love is eating me alive. I am currently adapating Zfeldmans original use of Alexa-Home, to help build applications that make alexa work more seamlessly with my current home setup.


## Setting up

You'll need to clone the repository from GitHub in the Terminal. I recommend putting it in the folder `~/dev/alexa-home`

You'll also need to set some environmental variables, which could be accomplished like this:

````bash
# in a file called .env, located at ~
# try vim ~/.env or nano ~/.env

export NEST_EMAIL=your_nest_email@awesome.com
export NEST_PASS=your_nest_password_not_test123

export AMAZON_EMAIL=youramazonlogin
export AMAZON_PASSWORD=your_awesome_pass_not_12345
````

For more, check out [Using Environment Variables to Safely Store API Credentials](http://blog.zfeldman.com/2014-04-07-Using-Environment-Variables-to-Safely-Store-API-Credentials)(

## Getting Started

This has to be run on the same network your Hue is on, but not necessarily the same network your Echo is on.

1) Clone this repository (see the link on the right) or download it as a zip file.

2) Open up the directory in your terminal application by dragging it into Terminal from the Finder or using the `cd` (change directory) command, I.E. `cd /home/pi/dev/alexa-home`

3) Run `bundle install` (I'm assuming you have Ruby 2.0+, using `ruby -v` to find out, if not try rbenv or rvm to upgrade).

3) If you plan on using a Hue setup, press the button on top of your Hue unit

4) Type `chmod +x startupScript.sh && ./startupScript.sh`
chmod +x startupScript.sh && ./startupScript.sh

5) This will start Alexa Home in the background. To stop Alexa Home, see "Stopping Alexa Home"

## Existing Modules

1) Itunes

2) Spotify

## Module Roadmap

I'd love to get these resolvers/modules done at some point too:

1) Spotify find a users tracks
  ~write a double or tripple random script for actualy shuffle mode

2) Posting tweets onto twitter
  ~have her read you back the recent tweets, which is a little ways off

3) Speaker switching
  ~switch where music is being played from, and which device is sending the sound.

## Stopping Alexa Home

1) Type `ps aux | grep ruby` at the Terminal to see a list of running Ruby processes

2) If you see the server (app.rb) or the Watir runner (watir-login.rb) and want to stop either of them, type `sudo kill -9 <PID>` , PID corresponding to the program's process ID.

## Contributors

[@zachfeldman](https://twitter.com/zachfeldman)
[@midorineko](residentsleeper.blogspot.com)

## Contributing

Send in pull requests!


## License

<a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/">Creative Commons Attribution-NonCommercial 4.0 International License</a>.
