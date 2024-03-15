# Setting Up

1. Clone this repository

        git clone git@github.com:brian-petersen/dotfiles.git .dotfiles

2. Run setup script

        cd ~/.dotfiles && bash setup.sh

3. Install neovim plugins

        nvim
        :PackerSync

# Distro Notes

## Arch Linux

- Install `pkgfile` and enable database updates: `pacman -S pkgfile && pkgfile --update` and `systemctl enable pkgfile-update.timer`
