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

## Installation

Before you can run the installation procedures you will need to boostrap yourself into having the following:

 * An administrator account on the Mac you are installing into
 * A way to log into github from the command line (ssh key, or password auth)
 * A way to run git on the command line

As of El Capitan, you will be prompted to download and install git via the command line tools package.

### The simple way...

You can clone the repository wherever you want. (I like to keep it in `~/Projects/dotfiles`, with `~/dotfiles` as a symlink.) The bootstrapper script will pull in the latest version and copy the files to your home folder.

```bash
git clone https://github.com/converge-co/dotfiles.git && cd dotfiles && source bootstrap.sh
sh ./.osx
sh ./brew.sh
sh ./setup-converge.sh
```
(beware, the final step of setup-converge.sh installs GCC, which takes 1-2hrs to install)

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

### Sensible OS X defaults

When setting up a new Mac, you may want to set some sensible OS X defaults:

```bash
./.osx
```

### Install Homebrew formulae

When setting up a new Mac, you may want to install some common [Homebrew](http://brew.sh/) formulae (after installing Homebrew, of course):

```bash
./brew.sh
```
