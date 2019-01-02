#!/bin/bash

brew install caskroom/cask/brew-cask
brew tap caskroom/fonts
brew tap colindean/fonts-nonfree

# Apps
apps=(
1password
airtame
appcleaner
caffeine
chefdk
clipy
coconutbattery
contexts
docker
etcher
font-hack
font-hack-nerd-font
font-inconsolata
font-inconsolata-for-powerline
font-microsoft-office
font-open-sans
font-oswald
font-roboto-mono
github
google-chrome
google-cloud-sdk
iterm2
itsycal
java
logitech-options
macs-fan-control
minikube
mysqlworkbench
near-lock
qmk-toolbox
skype
skype-for-business
slack
spectacle
spotify
steam
teamviewer
the-unarchiver
tomighty
tunnelblick
vagrant
virtualbox
visual-studio-code
)

# Default is: /Users/$user/Applications
echo "installing apps..."
for var in "${apps[@]}"
  do
    brew cask install "${var}"
  done

brew cask cleanup
