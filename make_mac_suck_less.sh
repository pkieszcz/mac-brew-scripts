#!/usr/bin/env bash

# Ask for the administrator password upfront
if [ $(sudo -n uptime 2>&1|grep "load"|wc -l) -eq 0 ]
then
    echo "Some of these settings are system-wide, therefore we need your permission."
    sudo -v
    echo ""
fi

echo "Disable sudden motion sensor. (Not useful for SSDs)."
sudo pmset -a sms 0

echo "Disable press-and-hold for keys in favor of key repeat."
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

echo "Set a fast keyboard repeat rate, after a good initial delay."
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 25

echo "Speed up mission control animations."
defaults write com.apple.dock expose-animation-duration -float 0.1

echo "Remove the auto-hiding dock delay."
defaults write com.apple.dock autohide-delay -int 0

echo "Set dock size to 32px"
defaults write com.apple.dock tilesize -int 32

echo "Use the dark theme."
defaults write ~/Library/Preferences/.GlobalPreferences AppleInterfaceStyle -string "Dark"

echo "Save screenshots in PNG format."
defaults write com.apple.screencapture type -string png

echo "Save screenshots to user screenshots directory instead of desktop."
if [[ ! -e ~/Screenshots ]]; then
  mkdir ~/Screenshots
else
  echo "Folder ~/Screenshots already exists"
fi
defaults write com.apple.screencapture location -string ~/screenshots

echo "Disable menu transparency."
defaults write com.apple.universalaccess reduceTransparency -int 1

#echo "Increase contrast."
#defaults write com.apple.universalaccess increaseContrast -int 1

echo "Disable mouse enlargement with jiggle."
defaults write ~/Library/Preferences/.GlobalPreferences CGDisableCursorLocationMagnification -bool true

echo "Disable annoying UI error sounds."
defaults write com.apple.systemsound com.apple.sound.beep.volume -int 0
defaults write com.apple.sound.beep feedback -int 0
defaults write com.apple.systemsound com.apple.sound.uiaudio.enabled -int 0
osascript -e 'set volume alert volume 0'

echo "Show all filename extensions."
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "Disable the warning when changing a file extension."
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo "Use list view in all Finder windows by default."
defaults write com.apple.finder FXPreferredViewStyle -string '"Nlsv"'

echo "Show the ~/Library folder."
chflags nohidden ~/Library

echo "Show the /Volumes folder."
sudo chflags nohidden /Volumes

#echo "Show hidden files (whose name starts with dot) in finder."
#defaults write com.apple.finder AppleShowAllFiles true

echo "Show full file path in finder windows."
defaults write _FXShowPosixPathInTitle com.apple.finder -int 1

echo "Don't write DS_Store files to network shares."
defaults write DSDontWriteNetworkStores com.apple.desktopservices -int 1

echo "Don't ask to use external drives as a Time Machine backup."
defaults write DoNotOfferNewDisksForBackup com.apple.TimeMachine -int 1

echo "Disable natural scrolling."
defaults write ~/Library/Preferences/.GlobalPreferences com.apple.swipescrolldirection -bool false

echo "Enable Developer Tools for Safari"
defaults write com.apple.Safari WebKitDeveloperExtras -bool true

# Security And Privacy Improvements
echo "Disable Safari from auto-filling sensitive data."
defaults write ~/Library/Preferences/com.apple.Safari AutoFillCreditCardData -bool false
defaults write ~/Library/Preferences/com.apple.Safari AutoFillFromAddressBook -bool false
defaults write ~/Library/Preferences/com.apple.Safari AutoFillMiscellaneousForms -bool false
#defaults write ~/Library/Preferences/com.apple.Safari AutoFillPasswords -bool false

echo "Disable Safari from automatically opening files."
defaults write ~/Library/Preferences/com.apple.Safari AutoOpenSafeDownloads -bool false

#echo "Always block cookies and local storage in Safari."
#defaults write ~/Library/Preferences/com.apple.Safari BlockStoragePolicy -bool false

echo "Enable Safari warnings when visiting fradulent websites."
defaults write ~/Library/Preferences/com.apple.Safari WarnAboutFraudulentWebsites -bool true

#echo "Disable javascript in Safari."
#defaults write ~/Library/Preferences/com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptEnabled -bool false
#defaults write ~/Library/Preferences/com.apple.Safari WebKitJavaScriptEnabled -bool false

echo "Block popups in Safari."
defaults write ~/Library/Preferences/com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false
defaults write ~/Library/Preferences/com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false

#echo "Disable plugins and extensions in Safari."
#defaults write ~/Library/Preferences/com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2WebGLEnabled -bool false
#defaults write ~/Library/Preferences/com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2PluginsEnabled -bool false
#defaults write ~/Library/Preferences/com.apple.Safari WebKitPluginsEnabled -bool false
#defaults write ~/Library/Preferences/com.apple.Safari ExtensionsEnabled -bool false
#defaults write ~/Library/Preferences/com.apple.Safari PlugInFirstVisitPolicy PlugInPolicyBlock
#defaults write ~/Library/Preferences/com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled -bool false
#defaults write ~/Library/Preferences/com.apple.Safari WebKitJavaEnabled -bool false

echo "Safari should treat SHA-1 certificates as insecure."
defaults write ~/Library/Preferences/com.apple.Safari TreatSHA1CertificatesAsInsecure -bool true

echo "Disable pre-loading websites with high search rankings."
defaults write ~/Library/Preferences/com.apple.Safari PreloadTopHit -bool false

echo "Disable Safari search engine suggestions."
defaults write ~/Library/Preferences/com.apple.Safari SuppressSearchSuggestions -bool true

echo "Enable Do-Not-Track HTTP header in Safari."
defaults write ~/Library/Preferences/com.apple.Safari SendDoNotTrackHTTPHeader -bool true

echo "Disable pdf viewing in Safari."
defaults write ~/Library/Preferences/com.apple.Safari WebKitOmitPDFSupport -bool true

echo "Display full website addresses in Safari."
defaults write ~/Library/Preferences/com.apple.Safari ShowFullURLInSmartSearchField -bool true

echo "Disable loading remote content in emails in Apple Mail."
defaults write ~/Library/Preferences/com.apple.mail-shared DisableURLLoading -bool true

echo "Send junk mail to the junk mail box in Apple Mail."
defaults write ~/Library/Containers/com.apple.mail/Data/Library/Preferences/com.apple.mail JunkMailBehavior -int 2

echo "Disable spotlight universal search (don't send info to Apple)."
defaults write com.apple.safari UniversalSearchEnabled -int 0

echo "Disable Captive Portal Hijacking Attack."
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control Active -bool false

echo "Set screen to lock as soon as the screensaver starts."
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

echo "Don't default to saving documents to iCloud."
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

echo "Disable crash reporter."
defaults write com.apple.CrashReporter DialogType none

echo "Enable Stealth Mode. Computer will not respond to ICMP ping requests or connection attempts from a closed TCP/UDP port."
sudo defaults write /Library/Preferences/com.apple.alf stealthenabled -bool true

echo "Disable wake on network access."
sudo systemsetup -setwakeonnetworkaccess off

echo "Disable Bonjour multicast advertisements."
sudo defaults write /Library/Preferences/com.apple.mDNSResponder.plist NoMulticastAdvertisements -bool YES

echo "Enable Mac App Store automatic updates."
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

echo "Check for Mac App Store updates daily."
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

echo "Download Mac App Store updates in the background."
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

echo "Install Mac App Store system data files & security updates."
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

echo "Turn on Mac App Store auto-update."
defaults write com.apple.commerce AutoUpdate -bool true

echo "Run one final check to make sure software is up to date."
softwareupdate -i -a

echo "Add custom stack for recent/documents/more "
defaults write com.apple.dock persistent-others -array-add '{"tile-data" = {"list-type" = 1;}; "tile-type" = "recents-tile";}'

echo "Show hidden app icons"
defaults write com.apple.dock showhidden -bool TRUE

echo "Use scroll gestures"
defaults write com.apple.dock scroll-to-open -bool TRUE

echo "Use suck animaton"
defaults write com.apple.dock mineffect suck

echo "Block dock from resizing"
defaults write com.apple.Dock size-immutable -bool yes

echo "Disable Dashboard"
defaults write com.apple.dashboard mcx-disabled -boolean YES

killall Dock
killall Finder
