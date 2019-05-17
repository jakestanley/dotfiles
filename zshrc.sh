#!/bin/zsh

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# export user theme
if [[ "$THEME" == "" ]]; then
    export THEME="base16-solarized-dark"
fi

# export wm if not set
if [[ "$WM" == "" ]]; then
    export WM=i3
fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
#ZSH_THEME="lukerandall"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Prevent duplicates in zsh history
setopt hist_ignorealldups
# Prevent finding duplicates in zsh history
HIST_FIND_NO_DUPS="true"

# Remove unnecessary whitespace before adding to history
HIST_REDUCE_BLANKS="true"
# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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

OS=`uname -s`
echo ""
SPLASH="Detected environment: $OS."

ARCHITECTURE=`uname -m`
if [[ "${ARCHITECTURE}" == "arm"* ]]; then
    SPLASH="${SPLASH} ARM architecture detected"
fi

echo $SPLASH

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(\
    git screen tmux docker pip gem rsync mvn aws nvm npm docker-compose \
    archlinux systemd \
    osx brew)

# assuming that if we're on ARM, then we're on the raspberry pi or some other 
# embedded platform, so only use a subset
if [[ "$ARCHITECTURE" = "arm"* ]]; then
    plugins=(git tmux)
fi

echo -e "Activating plugins: $plugins\n"

# User configuration
export CM_LAUNCHER=rofi

export MANPATH="/usr/local/man:$MANPATH"

# run the oh-my-zsh shell startup script
if [ -f $ZSH/oh-my-zsh.sh ]; then
	source $ZSH/oh-my-zsh.sh
fi

# alt+arrows navigation
bindkey '[C' forward-word
bindkey '[D' backward-word

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# shellcheck
export SHELLCHECK_OPTS="-e SC2086"

# create work aliases/functions file if it doesn't exist as the file should
# not be persisted in a public repository for security reasons
if [ ! -f ~/.zshrc.d/work.zsh ]; then
    echo "#!/usr/bin/env zsh" >> ~/.zshrc.d/work.zsh
    chmod u+x ~/.zshrc.d/work.zsh
fi

# aliases and functions
source ~/.aliases
source ~/.zshrc.d/functions.zsh
source ~/.zshrc.d/work.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
setopt hist_ignorealldups

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/vagrant/.sdkman"
[[ -s "/home/vagrant/.sdkman/bin/sdkman-init.sh" ]] && source "/home/vagrant/.sdkman/bin/sdkman-init.sh"
