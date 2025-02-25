# dotfiles

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

> Sometimes `mise upgrade` hangs, I think it's while installing `chezmoi`. Running ansible verbose for now

```bash
docker run -it --rm ubuntu bash
apt update && apt install curl git sudo
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply lnus
fish # or zsh
```
