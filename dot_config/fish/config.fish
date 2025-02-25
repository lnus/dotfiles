if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx EDITOR nvim

# Set up fisher if not exist
function setup_fisher --description "Install fisher and plugins"
    if not functions -q fisher
        curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
        fisher update  # Installs plugins from fish_plugins
    end
end

fish_add_path ~/.local/share/bob/nvim-bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.local/bin

~/.local/bin/mise activate fish | source
zoxide init fish | source
starship init fish | source

