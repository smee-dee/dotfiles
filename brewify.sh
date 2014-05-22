#!/usr/bin/env bash

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HOME_DIR=`cd ~; pwd`

cd $DOTFILES_DIR

function bootstrap() {
  brewify
  source ~/.bash_profile
}

function brewify() {
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  brew bundle Brewfile

  launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
  launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist

  ln -sfv /usr/local/opt/mysql55/*.plist ~/Library/LaunchAgents
  launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.mysql55.plist
  launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql55.plist

  ln -sfv /usr/local/opt/php54/*.plist ~/Library/LaunchAgents
  launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.php54.plist
  launchctl load ~/Library/LaunchAgents/homebrew.mxcl.php54.plist

  brew link
  brew cleanup
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	bootstrap
else
	read -p "This may overwrite existing files. Are you sure? (y/n) " -n 1
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		bootstrap
	fi
fi

unset bootstrap
unset brewify