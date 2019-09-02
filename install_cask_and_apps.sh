#!/bin/bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew cask

brew tap caskroom/fonts
brew tap colindean/fonts-nonfree

# Apps
apps=(
1password
appcleaner
caffeine
clipy
contexts
font-hack
font-hack-nerd-font
font-inconsolata
font-inconsolata-for-powerline
font-microsoft-office
font-open-sans
font-oswald
font-roboto-mono
google-chrome
iterm2
itsycal
logitech-options
slack
slate
spotify
the-unarchiver
tomighty
visual-studio-code
)

# Default is: /Users/$user/Applications
echo "installing apps..."
for var in "${apps[@]}"
  do
    brew cask install "${var}" --force
  done

brew cask cleanup
