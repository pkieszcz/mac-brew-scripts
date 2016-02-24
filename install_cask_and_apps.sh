#!/bin/bash

brew install caskroom/cask/brew-cask
brew tap caskroom/fonts
brew cask install font-inconsolata

# Apps
apps=(
	appcleaner
	atom
	cakebrew
	clipmenu
	evernote
	filezilla
	firefox
	flash
	Caskroom/versions/iterm2-beta
	karabiner
	tunnelblick
	google-chrome
	gpgtools
	skype
	slack
	sourcetree
	Caskroom/cask/tomighty
	thunderbird
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
