# dotfiles
desktop and shell configuration files

# setup

make sure `DOTFILES` is set. add it somewhere near the top of your `zshrc` or `profile` or whatever

```
export DOTFILES="$HOME/git/github.com/jakestanley/dotfiles"
```

# setup for zsh

- requires oh-my-zsh to be installed

```
ln -s $HOME/git/github.com/jakestanley/dotfiles/aliases.sh $ZSH_CUSTOM/aliases.zsh
ln -s $HOME/git/github.com/jakestanley/dotfiles/zsh/custom/functions.zsh $ZSH_CUSTOM/functions.zsh
```

## edit zsh plugins

I usually use

```
git screen tmux docker pip rsync mvn aws nvm npm docker-compose
```

and depending on the platform, some of

```
archlinux systemd osx
```

# set up other command line tool configs

- git: `./scripts/unix/git.sh`
- vim: `./scripts/unix/vim.sh`
etc etc

# set up graphical tool configs

- sublime: `./scripts/unix/sublime.sh`
