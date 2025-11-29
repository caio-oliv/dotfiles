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

## Setup system

Just the `setup-system.sh` script.

```sh
.config/sys/setup-system.sh --no-install-package
```

## Packages

- install yay: `.config/sys/package/install-yay.sh`
- install package list: `.config/sys/package/install-pkglist.sh`

## Services

Start systemd services with the provided scripts.

- system services: `.config/sys/service/start-system-service.sh`
- user services: `.config/sys/service/start-user-service.sh`
