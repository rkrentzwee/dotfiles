# Converge's dotfiles

![Screenshot of my shell prompt](http://i.imgur.com/EkEtphC.png)

## Current ToDos
* .osx
	* .osx closes Terminal when finished
	* Setup System Prefs -> Security -> Lock `immediately` on sleep/screen saver
	* Add user homedir to sidebar of Finder
	* Add Path button to top of Finder
	* Set desktop images to rotate by default
* Terminal default colors are a little screwed up
	* Background is white
	* Default text color is black
	* Few other colors are not that great (like during brew installation)
* RVM does not properly install default gems or switch to stable RVM ruby install

## Prereqs

Before you can run the installation procedures you will need to boostrap yourself into having the following (note, the instructions below  take you through these steps):

 * An administrator account on the Mac you are installing into
 * A way to log into github from the command line (ssh key, or password auth)
 * A way to run git on the command line

As of El Capitan, you will be prompted to download and install git via the command line tools package or you can install the entire Xcode and command line tools suite at once. If you do the Xcode install now, you may be stuck waiting for a while while that download happens. If you wait for XCode and just choose the command line tools installation, you can start Xcode while brew is installing packages.

## Installation & Setup

1. Open Terminal and run `git`
2. You will be prompted to install XCode Developer Tools, click Yes
3. Now go to Github and install their version of git via DMG

You can clone the repository wherever you want. (I like to keep it in `~/Projects/dotfiles`, with `~/dotfiles` as a symlink.) The bootstrapper script will pull in the latest version and copy the files to your home folder.

The first time you run `brew.sh` you will likely need to accept the XCode Command Line Tools T&C, then re-run `brew.sh`

```bash
git clone https://github.com/rkrentzwee/dotfiles.git && cd dotfiles && source bootstrap.sh
sh ./.osx
sh ./brew.sh
sh ./setup-converge.sh
```

To update in the future, `cd` into your local `dotfiles` repository and then:

```bash
source bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
set -- -f; source bootstrap.sh
```

### Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files, before any feature testing (such as [detecting which version of `ls` is being used](https://github.com/mathiasbynens/dotfiles/blob/aff769fd75225d8f2e481185a71d5e05b76002dc/.aliases#L21-26)) takes place.

Here’s an example `~/.path` file that adds `/usr/local/bin` to the `$PATH`:

```bash
export PATH="/usr/local/bin:$PATH"
```

### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

`~/.extra` could look something like this:

```bash
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="Mathias Bynens"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="mathias@mailinator.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository. It’s probably better to [fork this repository](https://github.com/mathiasbynens/dotfiles/fork) instead, though.
