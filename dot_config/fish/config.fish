if status is-interactive
    # Commands to run in interactive sessions can go here
end

# ~/.config/fish/functions/emedit.fish
set -gx EDITOR emedit

# Set up fisher if not exist
function setup_fisher --description "Install fisher and plugins"
    if not functions -q fisher
        curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
        fisher update # Installs plugins from fish_plugins
    end
end

set -x EZA_DEFAULT_FLAGS "--hyperlink --icons -F"

alias ls="eza $EZA_DEFAULT_FLAGS"
alias tree="eza $EZA_DEFAULT_FLAGS -T"
alias ftree="eza $EZA_DEFAULT_FLAGS -R"
alias ll="eza $EZA_DEFAULT_FLAGS -l"
alias la="eza $EZA_DEFAULT_FLAGS -lAh"

fish_add_path ~/.local/share/bob/nvim-bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.local/bin

~/.local/bin/mise activate fish | source
zoxide init fish | source
starship init fish | source
