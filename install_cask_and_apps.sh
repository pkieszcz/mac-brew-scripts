#!/bin/bash

brew install caskroom/cask/brew-cask
brew tap caskroom/fonts
brew cask install font-inconsolata
brew cask install font-open-sans
brew cask install font-oswald

# Apps
apps=(
	airmail-beta
	android-file-transfer
	appcleaner
	atom
	cakebrew
	ccleaner
	clipmenu
	evernote
	firefox
	flash
	flux
	font-inconsolata
	font-open-sans
	font-oswald
	google-chrome
	gpgtools
	Caskroom/versions/iterm2-beta
	itsycal
	keepassx
	osxfuse
	skype
	slack
	sourcetree
	spectacle
	spotify
	teamviewer
	Caskroom/cask/tomighty
	tunnelblick
	vagrant
	virtualbox
	wireshark
	xquartz
)

# Default is: /Users/$user/Applications
echo "installing apps..."
for var in "${apps[@]}"
  do
    brew cask install ${var}
  done

brew cask cleanup
