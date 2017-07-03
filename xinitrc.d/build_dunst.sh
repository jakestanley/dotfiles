#!/bin/sh

if [ -z "$THEME" ]; then
    echo "THEME not set. Will use the default"
    THEME="base16_default"
fi

echo "Using theme \"$THEME\""

rm ~/.config/dunst/dunstrc
cat \
    ~/.themes.d/dunst.d/${THEME}.dunstrc \
    ~/.config/dunst/config.d/general.dunstrc \
>> ~/.config/dunst/dunstrc
