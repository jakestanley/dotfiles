# Linux

My distro of choice for a while has been Arch Linux. The AUR makes it really easy to get hold of non-core software.

## Packages

- zsh
- xorg-xinit
- xorg-server
- git
- ohmyzsh
- obconf
- terminator
- openbox
- i3status
- xdotool
- pcmanfm
- xscreensaver
- ttf-ubuntu-font-family
- dunst
- rofi
- xorg-xsetroot
- tk (dependency for gitk for some reason)
- chromium
- noto-fonts
- gitg
- xorg-xcalc
- xorg-xkill
- xorg-xfontsel
- meld
- jq
- tmux
- go
- lxappearance
- pandoc
- dconf-editor
- clementine

## AUR

You need to install these packages the good old fashioned AUR way in order to use Yaourt (front end for the AUR)

- package-query [(AUR)](https://aur.archlinux.org/package-query.git)
- yaourt [(AUR)](https://aur.archlinux.org/yaourt.git)

```
cd /tmp
git clone https://aur.archlinux.org/package-query.git
git clone https://aur.archlinux.org/yaourt.git
cd package-query
makepkg -s -i
cd ../yaourt
makepkg -s -i
```

*Packages*

- mate (???)
- sublime-text - [repository](https://www.sublimetext.com/docs/3/linux_repositories.html#pacman)
- fzf [github](https://github.com/junegunn/fzf/)
- shellcheck (AUR)
- obkey (AUR)
- aws-cli (AUR)
- i3-gaps (AUR)
- lemonbar-xft-git (AUR)
- sqlcl (AUR)
- ultra-flat-icons-blue (AUR)
- gtk-theme-arc-git (AUR)
- escrotum-git (AUR)
- myrepos (AUR)
- postman-bin (AUR)
- spotify (AUR)
- slack-desktop (AUR)
- swagger-codegen (AUR)
