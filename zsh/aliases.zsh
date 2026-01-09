# My aliases
alias python='python3'
alias mysql='mysql --defaults-extra-file=~/.mycredentials.cnf'
alias mysqldump='mysqldump --defaults-extra-file=~/.mycredentials.cnf'
alias got='git'
alias gitc='git-cola'
alias maven='mvn'
alias mcv='mvn clean verify'
alias cbcp='xclip -selection clip-board -rmlastnl'

## Miscellaneous
alias nginxerrors='\less +F /var/log/nginx/error.log'
alias www='cd /var/www'
alias fortunecow='watch -n 3600 "fortune -s | cowsay"'
alias dots='cd $DOTFILES'
alias tmux='$DOTFILES/scripts/tmux-auto.sh'

## Make commands verbose by default
## Make cp recursive and verbose by default
alias cp='cp -r -v'
alias mv='mv -v'

## cd up n directories
alias less='less -N'
alias lesss='less -N'
alias les='less -N'
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'
alias ..6='cd ../../../../../..'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='\ls'
    #alias lsn='\ls'
    #alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias destroy='rm -rf'

alias cf='aws cloudformation --region eu-west-1'
alias dicker='docker'
alias dc='docker-compose'
alias sf='screenfetch'
alias rfcdate='date --rfc-3339=date'

# permissions, etc
alias ugx='chmod ug+x'
alias list='ls -l | grep --color=none -o "[^[:space:]]*$"'
alias gr='git_root'
alias fetch='git fetch --all'

# youtube-dl
alias mp3-ytdl='youtube-dl --extract-audio --audio-format mp3'
alias wav-ytdl='youtube-dl --extract-audio --audio-format wav'

## when you want to download a video that has no title
alias yda='youtube-dl -o "$(date +%F_%H-%M-%S).%(ext)s"'

# change to github.com git directory
alias gh='cd $HOME/git/github.com || mkdir -p $HOME/git/github.com'
