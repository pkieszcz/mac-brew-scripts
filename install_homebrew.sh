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

binaries=(
  autoconf
  bash
  bash-completion
  cmake
  coreutils
  findutils
  gdbm
  gettext
  git
  glib
  go
  grep
  groovy
  icdiff
  icu4c
  libffi
  libpng
  libssh2
  libyaml
  lua
  mas
  midnight-commander
  mono
  node
  openssl
  openssl@1.1
  pcre
  perl
  pkg-config
  pwgen
  pyenv
  pyenv-virtualenv
  python
  readline
  rename
  ruby
  rust
  s-lang
  sqlite
  terraform
  vim
  wget
)

echo "installing binaries..."
brew install "${binaries[@]}"

brew cleanup
