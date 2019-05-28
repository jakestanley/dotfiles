#!/bin/zsh

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# export user theme
if [[ "$THEME" == "" ]]; then
    export THEME="base16-solarized-dark"
fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

ZSH_THEME="lukerandall"

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
    archlinux systemd osx)

# assuming that if we're on ARM, then we're on the raspberry pi or some other 
# embedded platform, so only use a subset
if [[ "$ARCHITECTURE" = "arm"* ]]; then
    plugins=(git tmux)
fi

echo -e "Activating plugins: $plugins\n"

# User configuration

# run the oh-my-zsh shell startup script
if [ -f $ZSH/oh-my-zsh.sh ]; then
	source $ZSH/oh-my-zsh.sh
fi

# alt+arrows navigation
bindkey '[C' forward-word
bindkey '[D' backward-word

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
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
