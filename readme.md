# dotfiles

Clone the dotfiles into a bare repository

```sh
git clone --bare <git-repo-url> $HOME/.dotfiles
```

Checkout the content of the repository to your `$HOME`

```sh
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
```

> if there is already the same config files in the home directory, backup and remove then

And after the checkout use the `conf` alias to manage the git home repository

## Installation

```sh
sudo pacman -S \
  efibootmgr \
  man \
  man-db \
  zsh \
  git \
  nano \
  openssh \
  sway \
  alacritty \
  zellij \
  tmux \
  exa \
  ripgrep \
  neovim \
  helix \
  ttf-fira-code \
  starship

chsh -s $(which zsh)
```

### Other packages

- [firefox](https://wiki.archlinux.org/title/firefox#Installing) ^1
- [transmission-cli](https://archlinux.org/packages/extra/x86_64/transmission-cli/)

> 1. add `MOZ_ENABLE_WAYLAND=1` enviroment variable to `/etc/environment` for wayland support

## Services

### sway with seatd

```sh
sudo usermod -aG seat caio
# logout and login
sudo systemctl enable --now seatd.service
```

### ssh and ssh-agent

```sh
sudo systemctl enable --now sshd
systemctl --user enable --now ssh-agent
```
