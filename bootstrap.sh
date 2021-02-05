#!/bin/bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
pip3 install --user git+git://github.com/Lokaltog/powerline --verbose


(
  git clone https://github.com/powerline/fonts.git --depth=1
  cd fonts
  ./install.sh
  cd ..
  rm -rf fonts
)

(
  mkdir -p ~/.config/fontconfig/conf.d/
  curl https://raw.githubusercontent.com/powerline/fonts/master/fontconfig/50-enable-terminess-powerline.conf --output 50-enable-terminess-powerline.conf
  mv 50-enable-terminess-powerline.conf ~/.config/fontconfig/conf.d/
)
