# config.nu
#
# Installed by:
# version = "0.103.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.
# NOTE: config nu --doc | nu-highlight | less -R

# === Global shell settings ===
$env.config.buffer_editor = "nvim"
$env.config.show_banner = false

# === Prompt ===
$env.PROMPT_COMMAND_RIGHT = ""

# $env.TRANSIENT_PROMPT_COMMAND = ""

# === Aliases === 
alias ll = ls -l
alias la = ls -a
alias v = nvim
alias lg = lazygit
alias lado = lazydocker

# === Functions ===

# === Path and sourcing ===
$env.path ++= [
  "~/.local/bin",
  "~/.cargo/bin",
  "~/.local/share/bob/nvim-bin",
  "~/.config/emacs/bin"
]
use ($nu.default-config-dir | path join mise.nu)
source ~/.zoxide.nu
