#!/usr/bin/env bash

# link or relink i3 stuff

if [[ "${DOTFILES}" == "" ]]; then
    echo "DOTFILES is not set. Exiting to stay safe"
    exit 1
fi

echo -e "Deprecated: Link X stuff and use the $DOTFILES/xinitrc.d/builders/i3.sh script instead"
exit 0

#rm -rf $HOME/.config/i3
