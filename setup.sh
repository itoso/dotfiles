#!/bin/bash

DOT_FILES=(
 .vimrc
 .gvimrc
 .bashrc
 .bash_profile
)

for file in ${DOT_FILES[@]}
do
  if [ -a $HOME/$file ]; then
    ln -s $HOME/dotfiles/$file $HOME/$file.dot
    echo "$file exists. Creating ${file}.dot"
  else
    ln -s $HOME/dotfiles/$file $HOME/$file
    echo "シンボリックリンクを貼りました: $file"
  fi
done
