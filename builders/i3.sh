#!/usr/bin/env bash
CONFIG_DIR=$HOME/.config/i3
CONFIG_PATH=$CONFIG_DIR/config

mkdir -p $CONFIG_DIR
rm -f $CONFIG_PATH

if [[ -z $DOTFILES ]]; then
    echo "DOTFILES not set. Exiting"
    exit 1
fi

if [[ -z $THEME ]]; then
    echo "THEME not set. Exiting"
    exit 1
fi

THEME_PATH="$DOTFILES/themes.d/${THEME}/i3"
if [[ ! -f $THEME_PATH ]]; then
    echo "$(date --rfc-3339=seconds): $1 theme '$THEME' not found at path '$THEME_PATH'" >> ~/dotfiles.log
    exit 1
fi

echo "set \$theme ${THEME}" >> $CONFIG_PATH

cat \
    $DOTFILES/config/i3/config.d/top.cnf \
    $DOTFILES/config/i3/config.d/defaults.cnf \
    $DOTFILES/config/i3/config.d/gaps.cnf \
    $DOTFILES/config/i3/config.d/workspaces.cnf \
    $DOTFILES/config/i3/config.d/bindings-i3.cnf \
    $DOTFILES/config/i3/config.d/bindings-other.cnf \
    $DOTFILES/config/i3/config.d/bindings-music.cnf \
    $THEME_PATH \
    $DOTFILES/config/i3/config.d/colors.cnf \
    $DOTFILES/config/i3/config.d/keys.cnf \
    $DOTFILES/config/i3/config.d/mode-resize.cnf \
    $DOTFILES/config/i3/config.d/bottom.cnf \
>> $CONFIG_PATH

# link i3blocks and i3status files
rm -f $CONFIG_DIR/i3blocks.conf
ln -s $DOTFILES/config/i3/i3blocks.conf $CONFIG_DIR/i3blocks.conf

rm -f $CONFIG_DIR/i3status.conf
ln -s $DOTFILES/config/i3/i3status.conf $CONFIG_DIR/i3status.conf