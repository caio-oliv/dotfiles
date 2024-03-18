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

## Packages

- [x] Add script in `config/sys/packages/install-yay.sh` to install `yay`
- [ ] Add script in `config/sys/setup-system.sh` to setup the system after a clear Arch linux installation
  - [ ] setup kernel modules in `config/sys/kernel`
  - [-] install yay
  - [-] install **explicit** and **foreign** packages
  - [ ] enable system services
  - [ ] change the user default shell `chsh -s $(which zsh)`
  - [ ] enable user services
- [ ] Add script in `config/sys/sync-system.sh` to create the backup files for a full system setup

## Services

### seatd

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
