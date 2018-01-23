#!/bin/bash -ex

DOT_FILES_DIR="$(cd "$(dirname "${BASH_SOURCE:-$0}")"; pwd)"
echo "dotfiles directory: ${DOT_FILES_DIR}"

DOT_FILES=(
.vimrc
.gvimrc
.bashrc
.bash_profile
)

for file in ${DOT_FILES[@]}
do
    echo "[${file}]"
    # 通常ファイルが存在する場合はorigをつけて退避
    if [ -f $HOME/$file -a ! -L $HOME/$file ]; then
        mv $HOME/$file $HOME/$file.orig
        echo "$file exists. Moved to ${file}.orig"
    fi

    # 
    ln -siv ${DOT_FILES_DIR}/$file $HOME/$file
    echo "Symbolic link created for $file"
done
