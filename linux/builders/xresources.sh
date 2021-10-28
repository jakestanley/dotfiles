#!/usr/bin/env bash
CONFIG_PATH=$HOME/.Xresources

rm -f $CONFIG_PATH

if [[ -z $THEME ]]; then
    THEME="base16-solarized-dark"
    echo "$(date --rfc-3339=seconds): $1 THEME not set. Defaulting to '$THEME'" >> ~/dotfiles.log
fi

cat \
    $DOTFILES/themes.d/$THEME/Xresources \
    $DOTFILES/Xresources.d/urxvt.Xresources \
    $DOTFILES/Xresources.d/rofi.Xresources \
>> $CONFIG_PATH
