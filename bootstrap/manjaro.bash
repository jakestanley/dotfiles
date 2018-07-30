#!/usr/bin/env bash

set -e

echo -e "Running bootstrap script for Manjaro\n"

echo -e "Installing command line tools\n"

sudo pacman -Syuq \
    zsh \
    vim \
    git \
    htop \
    rsync \
    wget \
    curl \
    openssh \
    trash-cli \
    python \
    screen \
    tmux
    
echo -e "Installing developer tools\n"

sudo pacman -Syuq \
    docker \
    jdk8-openjdk

echo -e "Install X environment\n"

sudo pacman -Syuq \
    xorg-xinit \
    xorg-xserver \
    xorg-xsetroot \
    xorg-xkill \
    xorg-xcalc \
    xdotool \
    virtualbox-guest-modules-arch \
    virtualbox-guest-utils \
    xclip \
    openbox \
    chromium \
    noto-fonts \
    ttf-ubuntu-font-family \
    tk \
    pcmanfm

echo -e "Install desktop developer tools\n"

sudo pacman -Syuq \
    meld \
    gitg
    
echo -e "Install command line additions\n"

sudo pacman -Syuq \
    figlet \
    nethack \
    cmatrix
    
echo -e "Install desktop additions\n"

sudo pacman -Syuq \
    dunst \
    rofi
    
if which yaourt >/dev/null; then
    export YAOURT_INSTALLED="yes"
fi

echo -e "Done\n"
