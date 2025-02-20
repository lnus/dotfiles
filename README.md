# dotfiles

## Installation

Install [`gnu stow`](https://www.gnu.org/software/stow/) then

```sh
stow .
```

### For Windows

uhh, put the things where they supposed to be I guess.

Also, use [win32yank](https://github.com/equalsraf/win32yank). It kinda works.

Should be installable with like winget or chocolatey or something

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
4. [asdf](https://github.com/asdf-vm/asdf)
   - General version manager
   - Plugins:
     - [NodeJS](https://github.com/asdf-vm/asdf-nodejs)
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
