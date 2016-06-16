#!/bin/bash

###############################################################################
### GENERAL ###################################################################

# Appearance: Graphite
defaults write -g AppleAquaColorVariant -int 6
# Highlight color: Graphite
defaults write -g AppleHighlightColor -string '0.847059 0.847059 0.862745'
# Dark menu bar & dock
defaults write -g AppleInterfaceStyle -string 'Dark'
# Sidebar icon size: Small
defaults write -g NSTableViewDefaultSizeMode -int 1
# Number of recent items: None
osascript -e 'tell application "System Events" to tell appearance preferences to set recent applications limit to 0'
osascript -e 'tell application "System Events" to tell appearance preferences to set recent documents limit to 0'
osascript -e 'tell application "System Events" to tell appearance preferences to set recent servers limit to 0'


### DESKTOP & SCREEN SAVER ####################################################
# Start screen saver: Never
defaults -currentHost write com.apple.screensaver idleTime -int 0
# Hot Corner > Bottom Left: Screen saver
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0


### DOCK ######################################################################
# Size: 26 pixels
defaults write com.apple.dock tilesize -int 26
# Magnification: off
defaults write com.apple.dock magnification -bool false
# Position: left
defaults write com.apple.dock orientation -string 'left'
# Minimize effect: scale
defaults write com.apple.dock mineffect -string 'scale'
# Do not show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool false


### MISSION CONTROL ###########################################################
# Show Dashboard as a space: No
defaults write com.apple.dock dashboard-in-overlay -bool true
# Automatically rearrange Spaces based on most recent use: No
defaults write com.apple.dock mru-spaces -bool false
# Speed Up animations
defaults write com.apple.dock expose-animation-duration -float 0.1
# Group by apps
defaults write com.apple.dock "expose-group-by-app" -bool true


### SECURITY & PRIVACY ########################################################
# Ask for password after sleep or screensaver: Yes
defaults write com.apple.screensaver askForPassword -int 1
# Delay after asking password: 5sec
defaults write com.apple.screensaver askForPasswordDelay -int 5
# GateKeeper: off
sudo spctl --master-disable
# Firewall: on
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1
# Firewall stealth mode: on
sudo defaults write /Library/Preferences/com.apple.alf stealthenabled -int 1



### SCREEN ####################################################################
# Disable display from automatically adjusting brightness
sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Display Enabled" -bool false


### TRACKPAD ##################################################################
# Scroll direction natural: off
defaults write -g com.apple.swipescrolldirection -bool false
# Enable tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write -g com.apple.mouse.tapBehavior -int 1
defaults write -g com.apple.mouse.tapBehavior -int 1
# Trackpad app exposé swipe down
defaults write com.apple.dock showAppExposeGestureEnabled -bool true
# Trackpad speed
defaults write -g com.apple.trackpad.scaling 2.5


### KEYBOARD ##################################################################
# Enable tab on all controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
# Disable press and hold
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# Set keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 0
# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
# Automatically illuminate built-in MacBook keyboard in low light
defaults write com.apple.BezelServices kDim -bool true
# Turn off keyboard illumination when computer is not used for 1 minute
defaults write com.apple.BezelServices kDimTime -int 60
# Disable keyboard from automatically adjusting backlight brightness in low light
sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Keyboard Enabled" -bool false
