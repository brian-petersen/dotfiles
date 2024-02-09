#/usr/bin/env bash

set -x

git submodule update --init --recursive

mkdir -p $HOME/.config

ln -sT $HOME/.dotfiles/gdb-dashboard/.gdbinit $HOME/.gdbinit
ln -sT $HOME/.dotfiles/gitconfig $HOME/.gitconfig
ln -sT $HOME/.dotfiles/kitty $HOME/.config/kitty
ln -sT $HOME/.dotfiles/nvim $HOME/.config/nvim
ln -sT $HOME/.dotfiles/oh-my-zsh $HOME/.oh-my-zsh
ln -sT $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf
ln -sT $HOME/.dotfiles/zshrc $HOME/.zshrc
