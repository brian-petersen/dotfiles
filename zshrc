# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="refined"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    ag
    archlinux
    asdf
    brew
    bun
    # To get this working on Archlinux...
    #   pacman -S pkgfile
    #   sudo pkgfile --update
    #   sudo systemctl enable pkgfile-update.timer
    command-not-found
    common-aliases
    copyfile
    copypath
    deno
    direnv
    docker
    docker-compose
    dotnet
    encode64
    extract
    fzf
    gcloud
    gh
    git
    gitignore
    golang
    httpie
    kubectl
    mix
    pip
    rust
    safe-paste
    volta
)

source $ZSH/oh-my-zsh.sh

# Add ~/bin to path if it exists
if [ -d $HOME/bin ]; then
    export PATH=$HOME/bin:$PATH
fi

# Set up editor
if command -v nvim &> /dev/null; then
    export EDITOR=nvim
fi

# Set up fzf powered aliases
if command -v fzf &> /dev/null; then
    alias gch="git checkout \$(git branch | fzf | tr -d '[:space:]' | tr -d '[*]')"
fi

# Include local configs if necessary
if [[ -a $HOME/.zshrc.local ]]; then
    source $HOME/.zshrc.local
fi
