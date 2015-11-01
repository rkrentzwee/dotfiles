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

# Install GPG (for use with installing RVM)
brew install gpg

# Install `wget` with IRI support.
brew install wget --with-iri

# Install OpenSSL
brew install openssl

# Install other useful binaries.
brew install git
brew install hub # For working with Github
brew install xctool
brew install appledoc
brew install mobile-shell
brew install automake
brew install sqlite

# Various languages & compilers
# GCC is installed at the end of the Converge setup to save time
brew install python
pip install --upgrade pip setuptools
brew linkapps python

brew install caskroom/cask/brew-cask
brew cask install google-chrome
brew cask install dropbox
brew cask install 1password # What we use to share passwords
brew cask install alfred # Quickly access things
brew cask install skype
brew cask install google-hangouts
brew cask install flux # Save your eyes
brew cask install mou # Markdown parser
brew cask install slack # Team communications
brew cask install screenhero # Screen sharing
brew cask install onyx # Deep config/cleaning for OS X
brew cask install github-desktop # For working with Github via GUI

# Remove outdated versions from the cellar.
brew cleanup
