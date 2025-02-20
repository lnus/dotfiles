# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Antigen
source "$HOME/.antigen.zsh"
antigen init ~/.antigenrc

# Some aliases that I enjoy
alias v="nvim" # Change this to vim if you want to use vim, but why would you?
alias e="$EDITOR"
alias lg="lazygit" # Lazygit
alias wfs="cd /mnt/c/Users/Linus" # windows filesystem
alias zshsource="source ~/.zshrc"
alias vscode="code" # Change this to code-insiders if you want to use nightly

# https://github.com/lnus/stag
# Uses stag to cd
scd() {
    local tags="${1:-proj}" # Default to 'proj' if no args
    local dir=$(stag s $tags --dirs | fzf)
    if [ -n "$dir" ]; then
        cd "$dir"
    fi
}

# Use stag to open file in $EDITOR with fzf
sed() {
    if [ $# -eq 0 ]; then
        echo "Error: No tags provided" >&2
        return 1
    fi

    local tags="$1"
    local files=$(stag s $tags --files | fzf)
    if [ -n "$files" ]; then
        if [ -z "$EDITOR" ]; then
            echo "Error: \$EDITOR not set" >&2
            return 1
        fi
        $EDITOR "$files"
    fi
}

# VSCode function
c () {
    if [ $# -eq 0 ]; then
        vscode . # Run code with current directory
    else
        vscode $* # Run code with all arguments
    fi
}

# Source cargo
. "$HOME/.cargo/env"

# Append some stuff to path

# bob nvim install thing
path+=('/home/linus/.local/share/bob/nvim-bin')

# local bin
path+=('/home/linus/.local/bin')

# Go path
path+=('/usr/local/go/bin')

# Zoxide
# using cmd flag to replace cd with zoxide
# append '--cmd' to make cd z = cd, zi = cdi
eval "$(zoxide init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# bun completions
[ -s "/home/linus/.bun/_bun" ] && source "/home/linus/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Source asdf (mainly for Node)
. "$HOME/.asdf/asdf.sh"

# pnpm
export PNPM_HOME="/home/linus/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
