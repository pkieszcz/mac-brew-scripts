#!/bin/bash

# Check for Homebrew,
# Install if we don't have it
if test ! "$(which brew)"; then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep

echo "put this in Your's .bash_profile file in order too use this tools"
echo "$PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH"

#Taps
brew tap johanhaleby/kubetail
brew tap wata727/tflint
brew tap buo/cask-upgrade

binaries=(
ark
asciinema 
avrdude
awscli
awslogs
bash
bash-completion
brew-cask-completion
coreutils
cowsay
docker-compose
dshb
weaveworks/tap/eksctl
eksctl-aws-iam-authenticator
figlet
findutils
fzf
gnu-tar
gnutls
goenv
grep
hicolor-icon-theme
htop
hugo
icdiff
ifstat
ipcalc
jq
kompose
kops
kube-ps1
kubectx
kubernetes-cli
kubernetes-helm
kubetail
lolcat
lua
mas
midnight-commander
mongodb
mono
moreutils
mutt
mysql
ncurses
neofetch
neovim
nmap
openssl
packer
packer-completion
perl
pipenv
pipes-sh
postgresql
pwgen
pyenv
pyenv-virtualenv
python
python3
python@2
rbenv
rsync
s3cmd
shpotify
sqlite
telnet
tfenv
tflint
tmux
tree
tty-clock
watch
wget
wifi-password
zsh
zsh-completions
)

echo "installing binaries..."
brew install "${binaries[@]}"

brew cleanup
