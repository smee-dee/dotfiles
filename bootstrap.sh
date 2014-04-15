#!/usr/bin/env bash

EXCLUDED_FILES='^(.|.git|..|README\.md)$'

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HOME_DIR=`cd ~; pwd`

cd $DOTFILES_DIR
# git pull origin master

function symlink_all_files() {
  for file in .*; do
    [[ $file =~ $(echo $EXCLUDED_FILES) ]] && continue
    ORIGIN=$DOTFILES_DIR"/"$file
    TARGET=$HOME_DIR"/"$file
    echo $ORIGIN
    echo $TARGET
  done;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	symlink_all_files
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		symlink_all_files
	fi
fi
unset symlink_all_files
