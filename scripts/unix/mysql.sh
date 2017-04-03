# copy template credentials file
cp $DOTFILES_REPO_DIR/mycredentials.cnf ~/.mycredentials.cnf 2>/dev/null || :

# link my.cnf
ln -s $DOTFILES_REPO_DIR/my.cnf ~/.my.cnf

# make sure only the user can read mysql credentials
chmod 600 ~/.mycredentials.cnf
