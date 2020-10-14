#!/usr/bin/env bash

EXCLUDED_FILES='^(.|.git|.gitignore|..|README.md|update.sh|brewify.sh|dotify.sh)$'
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HOME_DIR=`cd ~; pwd`
TIMESTAMP=$(date +"%Y-%m-%d-%H-%M-%S")
BACKUP_FOLDER=$HOME_DIR"/.dotfiles-backups/"$TIMESTAMP

cd $DOTFILES_DIR
# git pull origin master

function bootstrap() {
  copy_all_files
  source ~/.bash_profile
  vim +PluginInstall +qall
}

function copy_all_files() {
  echo
  echo "=========================="
  echo "Start copying all files"
  echo "=========================="
	echo
  for file in `ls -a`; do
    [[ $file =~ $(echo $EXCLUDED_FILES) ]] && continue

    ORIGIN=$DOTFILES_DIR"/"$file
    TARGET=$HOME_DIR"/"$file

    backup_and_copy_file $file $ORIGIN $TARGET
  done;
}

function backup_and_copy_file() {
  FILENAME=$1
  ORIGIN=$2
  TARGET=$3
  BACKUP_FILE=$BACKUP_FOLDER"/"$FILENAME

  mkdir -p $BACKUP_FOLDER 2> /dev/null

  cp -r $TARGET $BACKUP_FILE 2> /dev/null && echo "Backed up $FILENAME -> $BACKUP_FILE"
  rm -rf $TARGET 2> /dev/null

  echo "Copying $ORIGIN -> $TARGET"
  cp -r $ORIGIN $TARGET || fail "Unable to copy $ORIGIN to $TARGET"
}

function fail() {
  ([ ! -z "$1" ] && echo $1) || echo "Something went wrong!"
  exit -1
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	bootstrap
else
	read -p "This may overwrite existing files in your home directory (although they are backed up). Are you sure? (y/n) " -n 1
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		bootstrap
	fi
fi

unset bootstrap
unset copy_all_files
unset fail
unset backup_and_copy_file
