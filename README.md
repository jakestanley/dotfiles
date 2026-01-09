# dotfiles
desktop and shell configuration files

# setup

Install oh-my-zsh

make sure `DOTFILES` and `ZSH_CUSTOM` are set and exported
add `DOTFILES` somewhere near the top of your `zshrc` or `profile` or whatever
and `ZSH_CUSTOM` at the bottom

```
export DOTFILES="$HOME/git/github.com/jakestanley/dotfiles"
...
export ZSH_CUSTOM="$ZSH_CUSTOM"
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

- git: `./scripts/git.sh`
- vim: `./scripts/vim.sh`
etc etc

# Git diff tools by platform

`./scripts/git.sh` now detects your OS and sets `git config --global include.path` to one of the files in `gitconfig.d/` (Linux gets `meld`, macOS gets `diffmerge`), so you automatically get the right difftool without editing the tracked `gitconfig`.

# set up graphical tool configs

- sublime: `./scripts/sublime.sh`

# PATH

you'll probably need to add the following to your zshrc somewhere
```
export PATH="$PATH:$HOME/.local/bin"
```
