#!/bin/bash

brew install caskroom/cask/brew-cask
brew tap caskroom/fonts
brew tap colindean/fonts-nonfree
brew tap jcgay/jcgay
brew install maven-deluxe
brew cask install font-inconsolata
brew cask install font-open-sans
brew cask install font-oswald

# Apps
apps=(
  alfred2
  clipmenu
  docker
  firefox
  flux
  font-inconsolata
  font-microsoft-office
  font-open-sans
  font-oswald
  google-chrome
  iterm2-beta
  itsycal
  java
  karabiner
  near-lock
  skype
  slack
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
