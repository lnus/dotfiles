# https://www.nushell.sh/book/configuration.html
 
# === Global shell settings ===
$env.config.buffer_editor = "hx"
$env.config.edit_mode = "vi"
$env.config.show_banner = false

$env.config.cursor_shape = {
  vi_insert: line
  vi_normal: block
}

# === Aliases === 
alias la = ls --all
alias ll = ls --long
alias lla = ls --long --all
alias sl = ls
alias tree = eza --tree --git-ignore --group-directories-first

alias e = hx
alias v = nvim
alias fg = job unfreeze

alias mv = mv --verbose
alias rm = rm --verbose
alias cp = cp --verbose --recursive --progress
 
# === Prompt ===
source ($nu.config-path | path dirname | path join "prompt.nu")

# === Scripts ===
export const SCRIPTS_DIR = ($nu.config-path | path dirname | path join scripts)
use $SCRIPTS_DIR *

# === Path and sourcing ===
$env.path ++= [
  "~/.local/bin",
  "~/.cargo/bin",
  "~/.local/share/bob/nvim-bin",
  "~/.config/emacs/bin"
]

use ($nu.default-config-dir | path join mise.nu)

source ~/.zoxide.nu
source ~/.cache/carapace/init.nu
