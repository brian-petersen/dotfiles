#/usr/bin/env bash

echo Setting up git submodules...
git submodule update --init --recursive

echo Making needed config directories...
mkdir -p $HOME/.config

echo Symbolically linking configs...
ln -s -i $HOME/.dotfiles/gdbinit $HOME/.gdbinit
ln -s -i $HOME/.dotfiles/gitconfig $HOME/.gitconfig
ln -s -i $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf
ln -s -i $HOME/.dotfiles/zshrc $HOME/.zshrc

# TODO figure out why this doesn't work
# ln -s -i $HOME/.dotfiles/nvim $HOME/.config/nvim
# ln -s -i $HOME/.dotfiles/oh-my-zsh $HOME/.oh-my-zsh
