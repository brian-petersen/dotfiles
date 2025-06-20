# Remove greeting
set fish_greeting

# Set up paths
if test -d $HOME/.asdf/shims
  fish_add_path --path $HOME/.asdf/shims
end

if test -d /opt/homebrew/bin
  fish_add_path --path /opt/homebrew/bin
end

if test -d $HOME/.cargo/bin
  fish_add_path --path $HOME/.cargo/bin
end

if test -d $HOME/bin
  fish_add_path --path $HOME/bin
end

if test -d $HOME/.local/bin
  fish_add_path --path $HOME/.local/bin
end

# nvim specific settings
if type -q nvim
  # Set nvim as default editor
  set -gx EDITOR nvim

  # Set nvim as man page viewer
  set -gx MANPAGER "nvim +Man!"
end

# Use starship as the prompt
if type -q starship
  starship init fish | source
end

# Functions
function git_main_branch -d "Detect name of main branch of current git repository"
  # heuristic to return the name of the main branch
  command git rev-parse --git-dir &> /dev/null || return

  for ref in refs/{heads,remotes/{origin,upstream}}/{main,master,trunk}
    if command git show-ref -q --verify $ref
      echo (string split -r -m1 -f2 / $ref)
      return
    end
  end

  echo main
end

function gch --description "Use fzf to interactively checkout of local branches"
  set branch (git branch --sort=-committerdate --format="%(refname:short)" | fzf --reverse --height=40% --prompt="Git branch > ")
  if test -n "$branch"
    git checkout $branch
  end
end

# docker
abbr db "docker build"
abbr dc "docker compose"
abbr di "docker images"
abbr dps "docker ps"
abbr dsa "docker stop \$(docker ps -a -q) > /dev/null"

# git (see https://github.com/lewisacidic/fish-git-abbr/tree/master for inspiration)
abbr g "git"
abbr gb "git branch"
abbr gba "git branch --all"
abbr gbd "git branch --delete"
abbr gc "git commit"
abbr gca "git commit --amend"
abbr gcm "git checkout \$(git_main_branch)"
abbr gco "git checkout"
abbr gd "git diff"
abbr gf "git fetch"
abbr gfa "git fetch --all --prune --jobs=10"
abbr gl "git log"
abbr glog "git log --oneline --decorate --graph"
abbr gloga "git log --oneline --decorate --graph --all"
abbr gls "git log --stat"
abbr gpf "git push --force"
abbr gst "git status"

# ls
abbr l "ls -lFh"
abbr ll "ls -lFh"
abbr la "ls -lAFh"

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
