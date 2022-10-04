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

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
eval $(thefuck --alias)

# Aliases

alias la="ls -la"


# Functions

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
    nvim "$*"
fi
}

alias vim="v"

# VS Code function
c () {
if [ $# -eq 0 ]; then
    code "$(fzf)"
else
    code "$*"
fi
}

# fzf

# export FZF_DEFAULT_COMMAND='find'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
