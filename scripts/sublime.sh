#!/usr/bin/env bash

if [[ "${DOTFILES}" == "" ]]; then
    echo "DOTFILES is not set. Exiting to stay safe"
    exit 1
fi

OS=$(uname -s)

if [ "$OS" == 'Darwin' ]; then
    TEXT_DIR="$HOME/Library/Application Support/Sublime Text 3"
    MRGE_DIR="$HOME/Library/Application Support/Sublime Merge"
elif [ "$OS" == 'Linux' ]; then
    TEXT_DIR="$HOME/.config/sublime-text-3"
    MRGE_DIR="$HOME/.config/sublime-merge"
else
    echo "Environment ${OS} is not supported"
    exit 1
fi

echo "sublime dir..."
echo $TEXT_DIR
echo "merge dir..."
echo $MRGE_DIR

mkdir -p "$TEXT_DIR/Packages"
rm -rf   "$TEXT_DIR/Packages/User"
ln -s    "$DOTFILES/config/sublime-text-3/Packages/User" \
         "$TEXT_DIR/Packages/User"

mkdir -p "$MRGE_DIR/Packages"
rm -rf   "$MRGE_DIR/Packages/User"
ln -s    "$DOTFILES/config/sublime-merge/Packages/User" \
         "$MRGE_DIR/Packages/User"
