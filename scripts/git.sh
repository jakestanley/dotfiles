#!/usr/bin/env bash

if [[ "${DOTFILES}" == "" ]]; then
    echo "DOTFILES is not set. Exiting to stay safe"
    exit 1
fi

rm -f ~/.gitconfig
rm -f ~/.gitignore_global

ln -s $DOTFILES/gitconfig ~/.gitconfig
ln -s $DOTFILES/gitignore_global ~/.gitignore_global

# Ensure a local git override file exists for per-machine settings.
local_git_config="$HOME/.gitconfig.local"
if [[ -e "$local_git_config" ]]; then
    echo "Git local overrides already exist at $local_git_config"
else
    cat <<'EOF' > "$local_git_config"
# Add per-machine overrides (GPG key, user/email overrides, etc.) below this line.
EOF
    echo "Created $local_git_config"
fi

# Install dotfiles-managed hooks to a stable per-user location (so no absolute
# DOTFILES path is required in git config).
hooks_dir="${XDG_CONFIG_HOME:-$HOME/.config}/git/hooks"
mkdir -p "$hooks_dir"

if [[ -d "$DOTFILES/git-hooks" ]]; then
    for hook in "$DOTFILES"/git-hooks/*; do
        [[ -f "$hook" ]] || continue
        dest="$hooks_dir/$(basename "$hook")"
        cp -f "$hook" "$dest"
        chmod +x "$dest" >/dev/null 2>&1 || true
    done
fi

git config --file "$local_git_config" core.hooksPath "$hooks_dir"

# Keep difftool config machine-local as well (avoid writing platform-specific
# absolute paths into the tracked gitconfig).
case "$(uname -s)" in
    Linux*)
        git config --file "$local_git_config" diff.tool meld
        git config --file "$local_git_config" difftool.prompt false
        git config --file "$local_git_config" difftool.meld.cmd 'meld "$LOCAL" "$REMOTE"'
        git config --file "$local_git_config" difftool.meld.trustExitCode true
        ;;
    Darwin*)
        git config --file "$local_git_config" diff.tool diffmerge
        git config --file "$local_git_config" difftool.prompt false
        git config --file "$local_git_config" difftool.diffmerge.cmd 'diffmerge "$LOCAL" "$REMOTE"'
        git config --file "$local_git_config" difftool.diffmerge.trustExitCode true
        ;;
esac
