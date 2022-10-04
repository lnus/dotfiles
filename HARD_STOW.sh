# ALERT: Don't use this, I just need it for a very specific thing.
# ALERT: Don't use this, I just need it for a very specific thing.
# ALERT: Don't use this, I just need it for a very specific thing.

rm -rf "$HOME/.config/nvim"
rm -f "$HOME/.vimrc"
rm -f "$HOME/.zshrc"
rm -f "$HOME/.p10k.zsh"

ln -s "./nvim/.config/nvim" "$HOME/.config/nvim" 
ln -s "./vim/.vimrc" "$HOME/.vimrc" 
ln -s "./zsh/.zshrc" "$HOME/.zshrc"
ln -s "./zsh/.p10k.zsh" "$HOME/.p10k.zsh"
