#!/bin/bash

# Makes symlinks to home directory from desired dotfiles.

dir=~/.dotfiles
files="vimrc gitconfig zshrc oh-my-zsh"

cd $dir

for file in $files; do
    mv -n ~/.$file ~/.$file.bak
    ln -s $dir/$file ~/.$file
done

echo "Be sure to pull oh-my-zsh repo (git submodule update --init --recursive)"
