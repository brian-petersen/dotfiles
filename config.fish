# Remove greeting
set fish_greeting

# Add $HOME/bin to path
if test -d $HOME/bin
  fish_add_path $HOME/bin
end

if test -d /opt/homebrew/bin
  fish_add_path /opt/homebrew/bin
end

if test -d $HOME/.cargo/bin
  fish_add_path $HOME/.cargo/bin
end

# Set nvim as default editor
if type -q nvim
  set -gx EDITOR nvim
end

# Use starship as the prompt
if type -q starship
  starship init fish | source
end

# git (see https://github.com/lewisacidic/fish-git-abbr/tree/master for inspiration)
abbr g "git"
abbr gst "git status"
abbr gco "git checkout"
abbr gb "git branch"
abbr gba "git branch --all"
abbr gbd "git branch --delete"
# gcm='git checkout $(git_main_branch)'
abbr gd "git diff"
abbr gf "git fetch"
abbr gfa "git fetch --all --prune --jobs=10"
abbr gl "git log"
abbr gls "git log --stat"
abbr glog "git log --oneline --decorate --graph"
abbr gloga "git log --oneline --decorate --graph --all"

# tmux
abbr ta "tmux attach -t"
abbr ts "tmux new-session -s"
abbr tl "tmux list-sessions"
abbr tksv "tmux kill-server"
abbr tkss "tmux kill-session -t"

# Source local fish config
if test -e $HOME/.config/fish/config.local.fish
  source $HOME/.config/fish/config.local.fish
end
