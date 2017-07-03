#!/bin/zsh
rm ~/.config/dunst/dunstrc
cat \
    ~/.themes.d/dunst.d/${THEME}.dunstrc \
    ~/.config/dunst/config.d/general.dunstrc \
>> ~/.config/dunst/dunstrc
