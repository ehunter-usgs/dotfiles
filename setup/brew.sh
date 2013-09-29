#!/usr/bin/env bash

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils
echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils
# Install Bash 4
brew install bash

# Install wget with IRI support
brew install wget --enable-iri

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep
brew tap josegonzalez/homebrew-php
brew install php54

# Install other useful binaries
brew install ack
brew install git
brew install imagemagick
brew install lynx
brew install node
brew install tree
brew install webkit2png

brew tap homebrew/versions
brew install lua52

# Install native apps
brew tap phinze/homebrew-cask
brew install brew-cask

function installcask() {
	if brew cask info "${@}" | grep "Not installed" > /dev/null; then
		brew cask install "${@}"
	else
		echo "${@} is already installed."
	fi
}

installcask google-chrome
installcask google-chrome-canary
installcask imagealpha
installcask imageoptim
installcask miro-video-converter
installcask sublime-text
installcask virtualbox
installcask vlc

# Remove outdated versions from the cellar
brew cleanup
