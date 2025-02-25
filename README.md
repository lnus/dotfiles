# dotfiles

> Sometimes `mise upgrade` hangs. Don't know why.

## Installation

See [chezmoi documentation](https://www.chezmoi.io/).

From a fresh machine run:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply lnus
```

If `chezmoi` is already installed, run:

```bash
chezmoi init --apply lnus
```

## Preview

```bash
docker run -it --rm ubuntu bash
apt update && apt install curl git sudo
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply lnus
fish # or zsh
```

Alternatively:

1. Clone the repo

```bash
git clone https://github.com/lnus/dotfiles.git
```

2. Build and run the container

```bash
docker-compose build ubuntu # or fedora/arch
docker-compose run --rm ubuntu # or fedora/arch
```

3. Inside the container

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply lnus
fish # or zsh
```
