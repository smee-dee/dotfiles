#!/usr/bin/env bash

EXCLUDED_FILES='^(.|.git|..|README.md|bootstrap.sh|.vim)$'
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HOME_DIR=`cd ~; pwd`

cd $DOTFILES_DIR
# git pull origin master

function bootstrap() {
  symlink_all_files
}

function symlink_all_files() {
  for file in `ls -a`; do
    [[ $file =~ $(echo $EXCLUDED_FILES) ]] && continue

    ORIGIN=$DOTFILES_DIR"/"$file
    TARGET=$HOME_DIR"/"$file

    re_symlink $ORIGIN $TARGET
  done;
}

function re_symlink() {
  ORIGIN=$1
  TARGET=$2

  if [ -L $TARGET ]; then
    echo "Unlinking "$TARGET
    unlink $TARGET || fail "Unable to unlink "$TARGET
  else
    echo "Backing up "$TARGET" -> "$TARGET".backup-dotfiles"
    mv $TARGET $TARGET".backup-dotfiles" || fail "Unable to backup $TARGET"
  fi

  echo "Linking $ORIGIN -> $TARGET"
  ln -s $ORIGIN $TARGET || fail "Unable to symlink $ORIGIN -> $TARGET"
}

function fail() {
  ([ ! -z "$1" ] && echo $1) || echo "Something went wrong!"
  exit -1
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	bootstrap
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo
    echo "=========================="
    echo "Start symlinking all files"
    echo "=========================="
		bootstrap
	fi
fi

unset bootstrap
unset symlink_all_files
unset fail
unset re_symlink
