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
alias zshconfig="nvim ~/.zshrc"
alias zshsource="source ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias vscode="code-insiders" # Change this to code if you want to use stable
alias v="nvim" # Change this to vim if you want to use vim, but why would you?
alias lg="lazygit" # Lazygit
alias z="zellij" # Zellij aliased to z for simplicity

# NOTE: Functions

# Profile a new zsh session
#
# NOTE: This is kind of useless now
# Since nvm was the main culprit for slow zsh startup
zshprofile () {
  export DO_ZSH_PROFILING=1
  time zsh -i -c exit
  export DO_ZSH_PROFILING=0
}

# VSCode function (use insiders)
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
#
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

# Source asdf mainly for node
. "$HOME/.asdf/asdf.sh"
