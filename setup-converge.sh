# Open Chrome to all the relevant download windows
open -a Google\ Chrome https://appleid.apple.com/account
open -a Google\ Chrome https://converge-industries.slack.com/
open -a Google\ Chrome http://www.sublimetext.com/
open -a Google\ Chrome https://packagecontrol.io/installation#st2
open -a Google\ Chrome https://www.dropbox.com/download?plat=mac
open -a Google\ Chrome https://agilebits.com/onepassword/mac
open -a Google\ Chrome http://www.alfredapp.com/#download
open -a Google\ Chrome http://www.github.com
open -a Google\ Chrome https://help.github.com/articles/generating-ssh-keys/
open -a Google\ Chrome https://github.com/fpillet/NSLogger/releases
open -a Google\ Chrome http://www.skype.com/en/download-skype/skype-for-mac/downloading/

mkdir -p ~/repositories
mkdir -p ~/others-repositories

# Ask for admin privileges upfront
sudo -v

# Install Alcatraz Package Manager for XCode
curl -fsSL https://raw.githubusercontent.com/supermarin/Alcatraz/master/Scripts/install.sh | sh

# Install Github for Mac
if [ -d /Applications/Github.app ]
then
	echo "Github for Mac found, skipping"
else
	echo "Github for Mac not installed, installing"
  mkdir -p ~/Downloads/apps
  mkdir -p ~/Downloads/apps/github-mac
	wget -O ~/Downloads/apps/github-mac/github-mac-latest.zip https://central.github.com/mac/latest -x
  sudo unzip ~/Downloads/apps/github-mac/github-mac-latest.zip -d /Applications/
  echo "Github for Mac not installed!"
fi

# Check that .ssh is there
if [ -d ~/.ssh ]
then
	echo "~/.ssh exists!"
else
	echo "~/.ssh does not exist, follow github instructions to setup"
fi

# Install RVM
if [ -d ~/.rvm ]
then
  echo "RVM installed, skipping RVM installation"
else
  echo "RVM not installed, installing RVM, Ruby & Cocoapods"
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  \curl -sSL https://get.rvm.io | bash -s stable --ruby --with-default-gems="cocoapods"
fi

# Setup Sublime (v2)
if [ -f ~/bin/subl ]
then
  echo "Sublime convenience symlink exists, skipping setup..."
else
  echo "Setting up Sublime 2 convenience symlink, use 'subl' to open files with sublime"
  ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" ~/bin/subl
fi

ST=~/Library/Application\ Support/Sublime\ Text\ 2
if [ -d $ST/Packages/Package\ Control ]
then
  echo "Sublime package list exists, skipping..."
else
  echo "Setting up default Sublime packages"
  mkdir -p $ST/{Installed\ Packages,Packages/User}
  curl https://packagecontrol.io/Package%20Control.sublime-package \
  > "$ST"/Installed\ Packages/Package\ Control.sublime-package
  cp sublime/sublime-2-Package\ Control.sublime-settings "$ST"/Packages/User/Package\ Control.sublime-settings
fi

echo "Done! Installing GCC as a last step. This will take a few hours..."
# This is out of order w/ the other brew installs because it takes forever
brew install gcc
