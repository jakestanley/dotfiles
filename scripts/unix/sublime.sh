#!/bin/sh

# link or relink sublime text 3 config

OS=`uname -s`
echo $OS

if [ "$OS" == 'Darwin' ]; then
    SUBLIME_DIR="$HOME/Library/Application Support/Sublime Text 3"
elif [ "$OS" == 'Linux' ]; then
    SUBLIME_DIR="$HOME/.config/sublime-text-3"
else
    echo "Environment ${OS} is not supported"
    exit 1
fi

echo "sublime dir..."
echo $SUBLIME_DIR
echo $DOTFILES

mkdir -p "$SUBLIME_DIR/Packages"
rm -rf   "$SUBLIME_DIR/Packages/User"
ln -s    "$DOTFILES/config/sublime-text-3/Packages/User" \
         "$SUBLIME_DIR/Packages/User"
