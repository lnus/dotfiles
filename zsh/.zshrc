# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="bureau"

# Use link below for customs thanks to n1snt
# https://gist.github.com/n1snt/454b879b8f0b7995740ae04c5fb5b7df
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Check if DO_ZSH_PROFILING is set and run zprof
if [[ "$DO_ZSH_PROFILING" == "1" ]]; then
    zmodload zsh/zprof
fi

# Some aliases that I enjoy
alias zshconfig="nvim ~/.zshrc"
alias zshsource="source ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias vscode="code-insiders" # Change this to code if you want to use stable
alias v="nvim" # Change this to vim if you want to use vim, but why would you?
alias lg="lazygit" # Lazygit
alias z="zellij" # Zellij aliased to z for simplicity

# Functions, liek a baws 
# Profile a new zsh session
zshprofile () {
  export DO_ZSH_PROFILING=1
  time zsh -i -c exit
}

# VSCode function (use insiders)
c () {
    if [ $# -eq 0 ]; then
        vscode . # Run code with current directory
    else
        vscode $* # Run code with all arguments
    fi
}

# TODO: Create a good ripgrep nvim binding

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

# This is GIGA-SLOW, what the fuck?
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Attempt to Lazy-load NVM
export NVM_DIR="$HOME/.nvm"

nvm_init () {
  unset -f nvm
  unset -f npm
  unset -f node
  unset -f npx
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

# Dummy functions for lazy-loading
nvm () {
  nvm_init
  nvm "$@"
}

npm () {
  nvm_init
  npm "$@"
}

node () {
  nvm_init
  node "$@"
}

npx () {
  nvm_init
  npx "$@"
}

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
