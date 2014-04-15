#!/bin/sh
cp -r ~/.vim ~/.vim.old 2>/dev/null
rm -fr ~/.vim 2>/dev/null
rm -f ~/.vimrc 2>/dev/null
rvm use system
brew install macvim --override-system-vim --enable-clipboard
git clone git@github.com:smee-dee/vim.git ~/.vim && cd ~/.vim && vim -c BundleInstall! -c q -c q -u bundles.vim && ln -s ~/.vim/vimrc ~/.vimrc
