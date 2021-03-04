#/usr/bin/env bash

git submodule update --init --recursive

mkdir -p $HOME/.config
mkdir -p $HOME/.tmux/plugins

ln -sT $HOME/.dotfiles/gdbinit $HOME/.gdbinit
ln -sT $HOME/.dotfiles/gitconfig $HOME/.gitconfig
ln -sT $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf
ln -sT $HOME/.dotfiles/zshrc $HOME/.zshrc
ln -sT $HOME/.dotfiles/nvim $HOME/.config/nvim
ln -sT $HOME/.dotfiles/oh-my-zsh $HOME/.oh-my-zsh
ln -sT $HOME/.dotfiles/tpm $HOME/.tmux/plugins/tpm
