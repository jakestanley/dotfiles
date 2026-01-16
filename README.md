# dotfiles
desktop and shell configuration files

# setup

Install oh-my-zsh

Run `./scripts/check.sh` first to see which files in your home directory already point into this repo, whether the local stubs (`.zsh_plugins`, `.zsh_aliases`, `.zsh_functions`, `.zshrc.local`, `.zprofile.local`) are in place, and which installer scripts are still worth running.

By default, `zprofile` will autodetect the repository root by checking, in order, any existing `DOTFILES`, `~/git/github.com/jakestanley/dotfiles`, and `~/git/github.com/dotfiles`. If your clone lives elsewhere, export `DOTFILES` before sourcing your shell and export `ZSH_CUSTOM` near the bottom of your profile.

```
export DOTFILES="$HOME/git/github.com/dotfiles"
...
export ZSH_CUSTOM="$ZSH_CUSTOM"
```

# setup for zsh

- requires oh-my-zsh to be installed

```
./scripts/zsh.sh
```
This script replaces `$ZSH/custom` with a symlink to the tracked `oh-my-zsh/custom` tree, which already contains `aliases.zsh`, `functions.zsh`, and any other helpers you need.

# Dotfiles-controlled zsh entry points

`./scripts/zsh.sh` now creates the `$ZSH/custom` symlink, links `zprofile`/`zshrc` from this repo into `~/.zprofile`/`~/.zshrc`, seeds `~/.zsh_plugins`, `~/.zsh_aliases`, and `~/.zsh_functions`, creates a stub `~/.zshrc.local`, and makes sure the shared helpers under `zsh/aliases.zsh` and `zsh/functions.zsh` are part of the bootstrap rather than living under `oh-my-zsh/custom`.  Keep secrets and automation outside version control in the `.local` files.

Define `~/.zsh_plugins` (or `$DOTFILES/zsh_plugins`) when you need machine-specific plugins.  Those files can export `ZSH_PLUGIN_OVERRIDE="git docker"` to replace the default list or `ZSH_PLUGIN_EXTRA="aws sublime"` to append to it, so the repo doesn’t assume the same plugins everywhere.

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
- screen: `./scripts/screen.sh`
- vim: `./scripts/vim.sh`
etc etc

Local git overrides (GPG key, work-specific user/email, etc.) belong in `~/.gitconfig.local`; `./scripts/git.sh` ensures that file exists and the tracked `gitconfig` includes it before linking.

# tmux convenience

The wrapper stored at `scripts/tmux-auto.sh` is already aliased in `oh-my-zsh/custom/aliases.zsh`, so running `tmux` without arguments reattaches the shared `anonymous` session (and still accepts explicit arguments when you need them).

# Git diff tools by platform

`./scripts/git.sh` now detects your OS and sets `git config --global include.path` to one of the files in `gitconfig.d/` (Linux gets `meld`, macOS gets `diffmerge`), so you automatically get the right difftool without editing the tracked `gitconfig`.

# set up graphical tool configs

- sublime: `./scripts/sublime.sh`

# PATH

you'll probably need to add the following to your zshrc somewhere
```
export PATH="$PATH:$HOME/.local/bin"
```
