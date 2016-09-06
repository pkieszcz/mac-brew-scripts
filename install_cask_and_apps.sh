#!/bin/bash

brew install caskroom/cask/brew-cask
brew tap caskroom/fonts
brew tap colindean/fonts-nonfree
brew cask install font-inconsolata
brew cask install font-open-sans
brew cask install font-oswald

# Apps
apps=(
  appcleaner
  atom
  cakebrew
  clipmenu
  docker
  evernote
  firefox
  flux
  font-inconsolata
  font-microsoft-office
  font-open-sans
  font-oswald
  google-chrome
  gpgtools
  iterm2-beta
  itsycal
  java
  karabiner
  keepassx
  skype
  slack
  sourcetree
  spectacle
  spotify
  teamviewer
  tomighty
  tunnelblick
  vagrant
  virtualbox
  wireshark
)

# Default is: /Users/$user/Applications
echo "installing apps..."
for var in "${apps[@]}"
  do
    brew cask install ${var}
  done

brew cask cleanup
