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

brew link xz # Apparently needed somewhere in here?

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
             appledoc \
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
             wget --with-iri \
             xquartz \

# Various languages & compilers
brew link gdbm # Brew says it needs this run before it can install
brew install python
pip install --upgrade pip setuptools
brew linkapps python
brew install root 
#brew install gcc # note that gcc takes a long time to download  


#---------------------------------
# Apps
#---------------------------------
brew install caskroom/cask/brew-cask # Find more casks at http://caskroom.io/search
brew cask install atom \
                  dropbox \
                  dialpad \
                  firefox \
                  flux \
                  github-desktop \
                  google-chrome \
                  mactex \
                  slack \
                  screenhero \
                  skype \
                  zoomus \
                  1password 

# Remove outdated versions from the cellar.
brew cleanup
