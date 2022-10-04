# ALERT: Don't use this, I just need it for a very specific thing.
# ALERT: Don't use this, I just need it for a very specific thing.
# ALERT: Don't use this, I just need it for a very specific thing.

rm -rf "$HOME/.config/nvim"
rm -f "$HOME/.vimrc"
rm -f "$HOME/.zshrc"
rm -f "$HOME/.p10k.zsh"

cp -r "./nvim/.config/nvim" "$HOME/.config/nvim" 
cp "./vim/.vimrc" "$HOME/.vimrc" 
cp "./zsh/.zshrc" "$HOME/.zshrc"
cp "./zsh/.p10k.zsh" "$HOME/.p10k.zsh"
