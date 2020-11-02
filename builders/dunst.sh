#!/usr/bin/env bash
CONFIG_DIR="$HOME/.config"
CONFIG_PATH="$CONFIG_DIR/dunstrc"

mkdir -p $CONFIG_DIR
rm -f $CONFIG_PATH

THEME_PATH="$DOTFILES/themes.d/${THEME}/dunstrc"
if [[ ! -f $THEME_PATH ]]; then
    echo "$(date --rfc-3339=seconds): $1 theme '$THEME' not found at path '$THEME_PATH'" >> ~/dotfiles.log
    exit 1
fi

cat \
    $THEME_PATH \
    $DOTFILES/config/dunst/config.d/general.dunstrc \
>> $CONFIG_PATH
