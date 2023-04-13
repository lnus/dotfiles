# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/linus/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Plugins

# https://github.com/marlonrichert/zsh-autocomplete
# source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# https://github.com/romkatv/powerlevel10k
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme

# Aliases

alias la="ls -la"

# Functions

# WSL Update script
if grep -qi microsoft /proc/version; then
    alias wslu="$HOME/dotfiles/wsl-update.sh"
fi

# File manager
fm () {
if [ $# -eq 0 ]; then
    nautilus "$(fzf)"
else
    nautilus "$*"
fi
}

# Vim function
v () {
if [ $# -eq 0 ]; then
    nvim "$(fzf)"
else
    nvim $* # Runs nvim with all commands
fi
}

#alias vim="v"

# fuzzy vim hidden
vh () { nvim "$(find . -print | fzf)" }

# fuzzy cd
fucd () { 
if [ $# -eq 0 ]; then
    cd $(find . \( ! -path '*/.*' \) -type d -print | fzf)
elif [ $1 = "." ]; then
    cd $(find . -type d -print | fzf)
else
    cd $1
    cd $(find . \( ! -path '*/.*' \) -type d -print | fzf)
fi
}


# VS Code function
c () {
if [ $# -eq 0 ]; then
    code "$(fzf)"
else
    code "$*"
fi
}

# ripgrep epic vim integration
rgl () { rg "$1" --no-heading --line-number | cut -d':' -f1-2 --output-delimiter=" +" }
rglv () { rgl "$1" | head -n 1 | v }

# fzf

# export FZF_DEFAULT_COMMAND='find'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# doom bin
path+=('/home/linus/.config/emacs/bin')
path+=('/home/linus/.local/bin')

# elixir ls
path+=('/home/linus/.elixir-ls/release')

# source ass duff
ASDF="$HOME/.asdf/asdf.sh"
if [ -f "$ASDF" ]; then
    . $ASDF
else
    # TODO: Maybe make this version independent(?)
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3
    . $ASDF
fi

export PATH
