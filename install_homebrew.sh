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
ark
asciinema
atk
atkmm
autoconf
automake
avr-binutils
avr-gcc
avrdude
awless
awscli
awslogs
bash
bash-completion
bdw-gc
boost
boost-build
brew-cask-completion
cairo
cairomm
cfssl
cmake
cmatrix
coreutils
cowsay
ctags
dep
dfu-programmer
docker-compose
dshb
eksctl
eksctl-aws-iam-authenticator
figlet
findutils
fontconfig
freetype
fribidi
fzf
gcc-arm-none-eabi
gd
gdbm
gdk-pixbuf
gettext
git
glib
glib-networking
glibmm
glide
gmp
gnu-tar
gnutls
go
gobject-introspection
goenv
graphite2
graphviz
grep
groovy
gsettings-desktop-schemas
gsl
gtk+
gtkmm
harfbuzz
hicolor-icon-theme
htop
hugo
icdiff
icu4c
ifstat
imagemagick
intltool
ipcalc
isl
jemalloc
jpeg
jq
k8sec
kompose
kops
kube-ps1
kubectx
kubernetes-cli
kubernetes-helm
kubetail
libcroco
libelf
libevent
libffi
libftdi0
libgsf
libhid
libidn2
libmpc
libpng
libpq
libpsl
librsvg
libsigc++
libsoup
libssh2
libtasn1
libtermkey
libtiff
libtool
libunistring
libusb
libusb-compat
libuv
libvterm
libyaml
little-cms
little-cms2
lolcat
lua
luajit
mas
midnight-commander
mongodb
mono
moreutils
mpfr
msgpack
mutt
mysql
ncurses
neofetch
neovim
nettle
nmap
node
nspr
nss
oniguruma
openjpeg
openssl
openssl@1.1
p11-kit
packer
packer-completion
pango
pangomm
pcre
pcre2
perl
pipenv
pipes-sh
pixman
pkg-config
poppler
popt
postgresql
potrace
pv
pwgen
pyenv
pyenv-virtualenv
python
python3
python@2
rarian
rbenv
rbenv-vars
readline
rename
rig
rsync
rtv
ruby
ruby-build
rust
s-lang
s3cmd
screenresolution
shpotify
sqlite
telnet
tfenv
tflint
the_silver_searcher
tmux
tokyo-cabinet
trash
tree
tty-clock
unibilium
vala
watch
webp
wget
wifi-password
xz
zsh
zsh-completions
)

echo "installing binaries..."
brew install "${binaries[@]}"

brew cleanup
