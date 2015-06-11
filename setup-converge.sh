# Open Chrome to all the relevant download windows
open -a Google\ Chrome https://appleid.apple.com/account
open -a Google\ Chrome https://slack.com/signin
open -a Google\ Chrome http://www.sublimetext.com/
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

# Install Github for Mac
if [ -d /Applications/Github.app ]
then
	echo "Github for Mac found, skipping"
else
	echo "Github for Mac not installed, installing"
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
