# Linux

My distro of choice for a while has been Arch Linux. The AUR makes it really easy to get hold of non-core software.

## Official Arch Linux packages

These packages are available in the official Arch Linux repositories

- zsh
- vim
- jdk8-openjdk
- docker _(install this before setting up users so you can add them to the docker group)_
- openssh
- xorg-xinit
- xorg-server
- git
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
- trash-cli
- go
- lxappearance
- pandoc
- dconf-editor
- clementine

## Creating users

Run these commands as the root user.

```
  useradd -m -s /bin/zsh jake
  passwd jake
  gpasswd -a jake docker
```

## AUR

- shellcheck (AUR)
- obkey (AUR)
- aws-cli (AUR)
- i3-gaps (AUR)
- sqlcl (AUR)
- ultra-flat-icons-blue (AUR)
- gtk-theme-arc-git (AUR)
- escrotum-git (AUR)
- myrepos (AUR)
- postman-bin (AUR)
- spotify (AUR)
- slack-desktop (AUR)
- swagger-codegen (AUR)

### Obtaining AUR packages

You need to install these packages the good old fashioned AUR way in order to use Yaourt (front end for the AUR). You cannot run `makepkg` as the root user so you'll need to do this after creating your user account.

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

## Third party packages

These packages are provided via third party repositories and can be installed and updated with `pacman` once the repository has been added to the `pacman` configuration.

- sublime-text [(repository)](https://www.sublimetext.com/docs/3/linux_repositories.html#pacman)

## Manual installation

Some software requires manual intervention. Fortunately this is a short list.

- ohmyzsh [(website)](http://ohmyz.sh/)
- fzf [(github)](https://github.com/junegunn/fzf/)

## Other

These packages are specific to certain use cases so I didn't want to include them with the general purpose packages

### Mate desktop environment

_These packages are specific to the Mate desktop environment_

// TODO

### Openbox desktop environment

_These packages are specific to the Openbox desktop environment_

- openbox
- obconf
- obkey (AUR)
