# Check if DO_ZSH_PROFILING is set and run zprof
if [[ "$DO_ZSH_PROFILING" == "1" ]]; then
    zmodload zsh/zprof
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="bureau"

# Use link below for customs thanks to n1snt
# https://gist.github.com/n1snt/454b879b8f0b7995740ae04c5fb5b7df
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Some aliases that I enjoy
alias vscode="code" # Change this to code-insiders if you want to use nightly
alias v="nvim" # Change this to vim if you want to use vim, but why would you?
alias e="$EDITOR"
alias zshconfig="v ~/.zshrc"
alias ohmyzsh="v ~/.oh-my-zsh"
alias zshsource="source ~/.zshrc"
alias lg="lazygit" # Lazygit
alias wfs="cd /mnt/c/Users/Linus" # windows filesystem
alias z="zellij" # Zellij aliased to z for simplicity

# NOTE: This is kind of useless now
zshprofile () {
  export DO_ZSH_PROFILING=1
  time zsh -i -c exit
  export DO_ZSH_PROFILING=0
}

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

# CUDA 12.3 bin & LD_LIBRARY_PATH /lib64
path+=('/usr/local/cuda-12/bin')
export LD_LIBRARY_PATH="/usr/local/cuda-12/lib64:$LD_LIBRARY_PATH"

# Jupyter notebook no-browser
alias jnb="jupyter notebook --no-browser"

# Go path
path+=('/usr/local/go/bin')

# Zoxide
# using cmd flag to replace cd with zoxide, z = cd, zi = cdi
eval "$(zoxide init zsh --cmd cd)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# bun completions
[ -s "/home/linus/.bun/_bun" ] && source "/home/linus/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Display profiling results if DO_ZSH_PROFILING is set
if [[ "$DO_ZSH_PROFILING" == "1" ]]; then
    zprof
fi

# Source asdf (mainly for Node)
. "$HOME/.asdf/asdf.sh"


# pnpm
export PNPM_HOME="/home/linus/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
