#/usr/bin/env bash

set -eux

git submodule update --init --recursive

mkdir -p $HOME/.config

ln -sT $HOME/.dotfiles/gitconfig $HOME/.gitconfig
ln -sT $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf
ln -sT $HOME/.dotfiles/zshrc $HOME/.zshrc
ln -sT $HOME/.dotfiles/nvim $HOME/.config/nvim
ln -sT $HOME/.dotfiles/oh-my-zsh $HOME/.oh-my-zsh
