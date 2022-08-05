## Installation

```sh
sudo pacman -S \
  efibootmgr \
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
  neovim

chsh -s $(which zsh)
curl -sS https://starship.rs/install.sh | sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
```

### Other packages

- [autojump](https://github.com/wting/autojump)
- [earlyoom](https://github.com/rfjakob/earlyoom)
- [docker and docker-compose](https://wiki.archlinux.org/title/docker#Installation)
- [code](https://aur.archlinux.org/packages/visual-studio-code-bin) *proprietary version*
- [helix](https://docs.helix-editor.com/install.html)
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
