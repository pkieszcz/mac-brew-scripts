#!/bin/bash

brew install caskroom/cask/brew-cask
brew tap caskroom/fonts
brew tap colindean/fonts-nonfree

# Apps
apps=(
  alfred
  appcleaner
  caffeine
  Clipy
  cheatsheet
  docker
  firefox
  flux
  font-inconsolata
  font-microsoft-office
  font-open-sans
  font-oswald
  google-chrome
  google-hangouts
  iterm2
  itsycal
  logitech-options
  mysqlworkbench
  near-lock
  shellcheck
  skype
  slack
  spectacle
  spotify
  the-unarchiver
  tomighty
  totalfinder
  tunnelblick
  vagrant
  virtualbox
)

# Default is: /Users/$user/Applications
echo "installing apps..."
for var in "${apps[@]}"
  do
    brew cask install "${var}"
  done

brew cask cleanup
