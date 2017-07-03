# TODO download more themes from git if there is an internet connection
rm -rf "${HOME}/.themes.d"
ln -s "${DOTFILES_REPO_DIR}/themes.d" "${HOME}/.themes.d"
