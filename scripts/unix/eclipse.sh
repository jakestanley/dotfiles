#!/usr/bin/env bash

if [[ "${DOTFILES}" == "" ]]; then
    echo "DOTFILES is not set. Exiting to stay safe"
    exit 1
fi

mkdir -p "${HOME}/.eclipse/"
rm -rf "${HOME}/.eclipse/mechanic"
ln -s "${DOTFILES}/eclipse/mechanic" "${HOME}/.eclipse/mechanic"
