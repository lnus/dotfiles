# dotfiles

Should I really be keeping p10k and ansible in here? yes I think.

## Installation

### With ansible

Install [ansible](https://docs.ansible.com/ansible/latest/getting_started/index.html) and run
the playbook with:

```bash
ansible-playbook install.yml -i inventory.yml -K
```

Or run `install.sh` which does the same thing.

### Manual

**ENSURE .config EXISTS**, otherwise it will symlink the entire directory.
This is not usually what you want.

Install [`gnu stow`](https://www.gnu.org/software/stow/) then

```sh
stow .
```

### For Windows

uhh, put the things where they supposed to be I guess.

Also, use [win32yank](https://github.com/equalsraf/win32yank). It kinda works.

Should be installable with like winget or chocolatey or something

### For demoing

> This is just to check if things are able to be reproduced in a clean env.

```bash
docker build -t dotfiles .
docker run --rm -it dotfiles
```

Then run the ansible playbook, it's very much a work in progress though. lmao.

## Some stuff I like to have

> TODO: Create some install script for these. Maybe go tryhard and make an ansible playbook.

**IMPORTANT:** `sudo apt install build-essential` & `sudo apt install stow`

1. [GitHub CLI](https://github.com/cli/cli)
   - Makes life easier (For initial auth)
2. [Rust + Cargo with rustup](https://www.rust-lang.org/tools/install)
   - Needed for bob
   - crabs are cute :3
3. [bob](https://github.com/MordechaiHadad/bob)
   - NeoVim version manager
4. [mise](https://github.com/jdx/mise)
   - General version manager
5. [ripgrep](https://github.com/BurntSushi/ripgrep)
   - RIP grep, I guess
6. [fzf](https://github.com/junegunn/fzf?tab=readme-ov-file#using-git)
   - Fuzzy finder
   - Needed for NeoVim + other stuff
   - can't live without it
7. [zoxide](https://github.com/ajeetdsouza/zoxide)
   - Better `cd` for a civilized era
8. [lazygit](https://github.com/jesseduffield/lazygit?tab=readme-ov-file#ubuntu)
   - Amazing git TUI
   - Integration with LazyVim
   - Written in Go (hell yeah)
