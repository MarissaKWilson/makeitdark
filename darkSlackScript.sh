#!/bin/bash

### Script to work with makeItDark on Slack 4.0 ###
### With Slack 4.0, they are packing away ssb-interop.bundle.js in app.asar ###
### This bash script for Mac will unpack the app.asar, append your code to the file, repack it, and remove the unpacked directory ###
### You must have Node installed first in order to run npx with asar ###
### See https://github.com/widget-/slack-black-theme/issues/98 for details ###

slackdir=/Applications/Slack.app/Contents/Resources
makeitdarkdir="/Users/mw799j/Documents/settings/slack/makeitdark"

npx asar extract $slackdir/app.asar $slackdir/extracted-asar;
sleep 4;
sudo python $makeitdarkdir/makeitdark.py
npx asar pack $slackdir/extracted-asar $slackdir/app.asar;
rm -r $slackdir/extracted-asar;
