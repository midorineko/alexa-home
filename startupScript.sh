#!/bin/bash

cd ~/Desktop/alexa/alexa-home
source ~/.env
bundle exec ruby app.rb &
bundle exec ruby watir-login.rb &
