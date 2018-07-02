#!/bin/sh

VIM_DIR="$HOME/.vim/"
VUNDLE_DIR="$HOME/.vim/bundle/Vundle.vim/" 

mkdir -p $VIM_DIR
if [ ! -d $VUNDLE_DIR ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git $VUNDLE_DIR 
fi
cp vimrc ~/.vimrc
cp -r ./configs ~/.vim/
cp clang-format "$HOME/.clang-format"

echo "Installing Plugins!"
vim +PlugClean! +PlugInstall +qall
echo "Done!"
