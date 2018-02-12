#!/usr/bin/env bash

# Install Brew
if [ -d ~/.cask ]
then
	echo "Brew found, skipping"
else
	echo "Brew not installed, installing"
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	echo "Brew installed!"
fi

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils

brew link xz # Not sure where this should go, so we're going to run it a few times


#---------------------------------
# Tools
#---------------------------------
brew install ack \
             automake \
             bash-completion \
             cmake \
             docker \
             git \
             hub \
             xctool \
             gpg \
             macvim \
             mas \
             mobile-shell \
             openssl \
             rsync \
             shellcheck \
             wget \

# Various languages & compilers
brew link gdbm # Brew says it needs this run before it can install
brew install gcc # note that gcc takes a long time to download  
brew install python
pip2 install --upgrade pip setuptools
brew linkapps python
brew install root 


#---------------------------------
# Apps
#---------------------------------
#brew tap caskroom/cask # Find more casks at http://caskroom.github.io/search
brew cask install atom \
                  dropbox \
                  firefox \
                  flux \
                  google-chrome \
                  mactex \
                  slack \
                  skype \
                  telegram \
                  zoomus \
                  1password 
                  xquartz \

# Remove outdated versions from the cellar.
brew cleanup
