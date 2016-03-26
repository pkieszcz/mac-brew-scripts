#!/bin/bash

brew install caskroom/cask/brew-cask
brew tap caskroom/fonts
brew cask install font-inconsolata
brew cask install font-open-sans
brew cask install font-oswald

# Apps
apps=(
  adium
	appcleaner
	atom
	airmail-beta
	clipmenu
	evernote
	filezilla
	firefox
	flash
	Caskroom/versions/iterm2-beta
	tunnelblick
	google-chrome
	gpgtools
	skype
	slack
	spotify
	sourcetree
	Caskroom/cask/tomighty
	virtualbox
	wireshark
  vagrant
)

# Default is: /Users/$user/Applications
echo "installing apps..."
for var in "${apps[@]}"
  do
    brew cask install ${var}
  done

brew cask cleanup
