# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

if [ -f "$HOME/.proxy_settings" ]; then
    # include proxy settings
    echo "Using proxy";
    . "$HOME/.proxy_settings";
fi

export PATH=$PATH:/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/sbin
export PATH=$PATH:/usr/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/usr/bin/core_perl
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/opt/jdk/jre/bin
export PATH=$PATH:$HOME/.local/bin:
export PATH=$PATH:$HOME/.npm/.bin:
export PATH=$PATH:$HOME/.pilau/lemonbar:
export PATH=$PATH:$HOME/.gem/ruby/2.5.0/bin

export DOTFILES=$HOME/git/github.com/madstanners/dotfiles

export VISUAL="vim"
export SVN_EDITOR="vim"
export GOPATH="${HOME}/go"
export NVM_DIR="$HOME/.nvm"
