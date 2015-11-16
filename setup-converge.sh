#!/usr/bin/env bash

# Open Chrome to all the relevant download windows
open -g -a Google\ Chrome https://appleid.apple.com/account
open -g -a Google\ Chrome https://converge-industries.slack.com/
open -g -a Google\ Chrome https://github.com/fpillet/NSLogger/releases
open -g -a Google\ Chrome https://pqrs.org/osx/karabiner/

mkdir -p ~/repositories
mkdir -p ~/others-repositories

# Ask for admin privileges upfront
sudo -v

# Install Alcatraz Package Manager for XCode
curl -fsSL https://raw.githubusercontent.com/supermarin/Alcatraz/master/Scripts/install.sh | sh

# Check that .ssh is there
if [ -d ~/.ssh ]
then
	echo "~/.ssh exists!"
else
	echo "~/.ssh does not exist, please view github page to setup ssh keys and close Google Chrome before proceeding"
	open -a Google\ Chrome -W https://help.github.com/articles/generating-ssh-keys/
fi

# Install RVM
if [ -d ~/.rvm ]
then
  echo "RVM installed, skipping RVM installation"
else
  echo "RVM not installed, installing RVM, Ruby & Cocoapods"
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  \curl -sSL https://get.rvm.io | bash -s stable --ruby --with-default-gems="cocoapods bundler"
  source $HOME/.rvm/scripts/rvm # Get RVM into the console's environment - UNTESTED (based in installing on PWQ's machine)
  rvm install ruby-2.2.1 # UNTESTED (based in installing on PWQ's machine)
  rvm use ruby-2.2.1 # UNTESTED
fi

# Install & Setup Atom
if [ -d /Applications/Atom.app ]
then
  echo "Atom exists, skipping setup..."
else
  echo "Installing Atom.."
  mkdir -p ~/Downloads/apps
  mkdir -p ~/Downloads/apps/atom
	wget -O ~/Downloads/apps/atom/atom-latest.zip https://atom.io/download/mac -x
  sudo unzip ~/Downloads/apps/atom/atom-latest.zip -d /Applications/
  echo "Atom installed!"
  echo -e "Please close Atom once it has finished its' initial setup, kthx"  | open -f -W -a Atom
  echo "Use 'atom' to open files with Atom"
  source install_atom_packages.sh
fi

# Fork the dotfiles repo
echo "Forking dotfiles repo to your github account so you can personalize in the future..."
hub fork

# Setup default Dock icons
add_app_to_dock(){
	defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/$1.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
}
add_app_to_dock 'Google Chrome'
add_app_to_dock 'Slack'
add_app_to_dock '1Password 5'
add_app_to_dock 'Atom'
add_app_to_dock 'Mou'
add_app_to_dock 'Utilities/Terminal'

killall Dock # Need to restart dock for new icons to show up

echo "Done! Installing GCC as a last step. This will take a few hours..."
# This is out of order w/ the other brew installs because it takes forever
brew install gcc
