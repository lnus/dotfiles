# https://www.nushell.sh/book/configuration.html
 
# === Global shell settings ===
$env.config.buffer_editor = "hx"
$env.config.edit_mode = "vi"
$env.config.show_banner = false

# === Prompt === (!!STARSHIP!!)
# $env.PROMPT_COMMAND_RIGHT = ""
# $env.TRANSIENT_PROMPT_COMMAND = ""

# === Aliases === 
alias ll = ls -l
alias la = ls -a
alias e = hx
alias v = nvim
alias lg = lazygit
alias lado = lazydocker

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

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

source ~/.zoxide.nu
source ~/.cache/carapace/init.nu
