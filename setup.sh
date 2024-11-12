echo Setting up submodules
git submodule update --init --recursive

echo Creating necessary directories
mkdir -p $HOME/.config
mkdir -p $HOME/.config/fish

create_symlink_if_not_exist() {
  local source="$1"
  local target="$2"

  if [ -e "$target" ]; then
    echo "Target already exists: $target"
  else

    ln -s "$source" "$target"
    echo "Symbolic link created: $target -> $source"
  fi
}

create_symlink_if_not_exist $HOME/.dotfiles/config.fish $HOME/.config/fish/config.fish
create_symlink_if_not_exist $HOME/.dotfiles/gitconfig $HOME/.gitconfig
create_symlink_if_not_exist $HOME/.dotfiles/kitty $HOME/.config/kitty
create_symlink_if_not_exist $HOME/.dotfiles/nvim $HOME/.config/nvim
create_symlink_if_not_exist $HOME/.dotfiles/oh-my-zsh $HOME/.oh-my-zsh
create_symlink_if_not_exist $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf
create_symlink_if_not_exist $HOME/.dotfiles/zshrc $HOME/.zshrc
