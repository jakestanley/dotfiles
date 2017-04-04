# copy template credentials file (if one doesn't exist)
cp -n $DOTFILES_REPO_DIR/mycredentials.cnf ~/.mycredentials.cnf 2>/dev/null || :

# rm existing my.cnf
rm ~/.my.cnf

# link my.cnf
ln -s $DOTFILES_REPO_DIR/my.cnf ~/.my.cnf

# make sure only the user can read mysql credentials
chmod 600 ~/.mycredentials.cnf
