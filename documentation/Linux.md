# Linux

My distro of choice for a while has been Arch Linux. The AUR makes it really easy to get hold of non-core software.

## Official Arch Linux packages

These packages are available in the official Arch Linux repositories

### Guest in VirtualBox

Assuming you're using the Arch kernel, you'll need to install these packages first and enable relevant modules for VirtualBox guest support.

- virtualbox-guest-modules-arch
- virtualbox-guest-utils

### Graphical user interface

In my experience video drivers cause me the most issues so I'm putting the basic packages needed to get a GUI running here first. Pick a desktop environment for testing. I recommend `openbox`.

- xorg-xinit
- xorg-server

### General purpose

- zsh
- vim
- htop
- xclip
- tree
- jdk8-openjdk
- maven
- rsync
- docker _(install this before setting up users so you can add them to the docker group)_
- openssh
- git
- terminator
- xdotool
- pcmanfm
- screenfetch
- xscreensaver
- ttf-ubuntu-font-family
- dunst
- rofi
- unzip
- xorg-xsetroot
- tk (dependency for gitk for some reason)
- chromium
- noto-fonts
- gitg
- xorg-xcalc
- xorg-xkill
- xorg-xfontsel
- meld
- wget
- jq
- tmux
- trash-cli
- go
- lxappearance
- pandoc
- dconf-editor
- clementine
- nethack

#### multilib

this repository can be added by uncommenting the `[multilib]` section in `/etc/pacman.conf`

- steam

## Creating users

Run these commands as the root user.

```
useradd -m -s /bin/zsh jake
passwd jake
gpasswd -a jake docker
```

## Python packages

- awscli
- awsebcli
- boto3

### Obtaining the Python package manager 'pip'

I think I've set up python/pip incorrectly every time I've done it until now, so I'm going to try and document what I consider the _right_ way to do it. You should do this when logged in as your day to day user.

- Download get-pip.py: `wget https://bootstrap.pypa.io/get-pip.py`
- `python get-pip.py --user` (the user part is very important)
- Use `python -m pip install -U <package> --user` to install/upgrade packages.
- Add `$HOME/.local/bin` to your path variable

## AUR packages

- shellcheck (AUR)
- sqlcl (AUR)
- ultra-flat-icons-blue (AUR)
- gtk-theme-arc-git (AUR)
- escrotum-git (AUR)
- myrepos (AUR)
- postman-bin (AUR)
- spotify (AUR)
- slack-desktop (AUR)
- spring-boot-cli (AUR)
- shunit2 (AUR)
- swagger-codegen (AUR)
- ddate (AUR)
- dropbox (AUR)

### Obtaining AUR packages

You need to install these packages the good old fashioned AUR way in order to use Yaourt (front end for the AUR). You cannot run `makepkg` as the root user so you'll need to do this after creating your user account. As you won't be doing this as the root user, you'll need to make sure you've given yourself elevate permissions by using `visudo` as root.

- package-query [(AUR)](https://aur.archlinux.org/package-query.git)
- yaourt [(AUR)](https://aur.archlinux.org/yaourt.git)

```
cd
mkdir tmp
cd tmp
git clone https://aur.archlinux.org/package-query.git
git clone https://aur.archlinux.org/yaourt.git
cd package-query
makepkg -si
cd ../yaourt
makepkg -si
```

## Font configuration

Adding the `FONT` environment variable to `/etc/vconsole.conf` changes the console font. I am partial to these fonts:
- ter-112n.psf.gz
- ter-114b.psf.gz (for small or high DPI screens)

## Third party packages

These packages are provided via third party repositories and can be installed and updated with `pacman` once the repository has been added to the `pacman` configuration.

- sublime-text [(repository)](https://www.sublimetext.com/docs/3/linux_repositories.html#pacman)

## Manual installation

Some software requires manual intervention. Fortunately this is a short list.

- ohmyzsh [(website)](http://ohmyz.sh/)
- fzf [(github)](https://github.com/junegunn/fzf/)
- fly
- IntelliJ IDEA Ultimate Edition [(website)](https://www.jetbrains.com/idea/download/)

## Desktop environments

These packages are specific to certain use cases so I didn't want to include them with the general purpose packages.

### i3 desktop environment

- i3status
- i3-gaps (AUR)

### Mate desktop environment

_These packages are specific to the Mate desktop environment_

// TODO

### Openbox desktop environment

_These packages are specific to the Openbox desktop environment_

- openbox
- obconf
- obkey (AUR)

## Troubleshooting

### Issues with keys

Your keyring may be out of date. Reinstalling the keyring with `pacman -S archlinux-keyring` should fix this issue.
