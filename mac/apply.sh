#!/usr/bin/env zsh
set -e
SCRIPT_DIR="${0:A:h}"

echo "\033[36mApplying Mac dotfiles...\033[0m"

# Apply .gitconfig
cp "$SCRIPT_DIR/.gitconfig" "$HOME/.gitconfig"
echo "  \033[32m[OK] .gitconfig -> $HOME/.gitconfig\033[0m"

# Apply global gitignore
cp "$SCRIPT_DIR/.gitignore_global" "$HOME/.gitignore_global"
git config --global core.excludesFile "$HOME/.gitignore_global"
echo "  \033[32m[OK] .gitignore_global -> $HOME/.gitignore_global\033[0m"

# Apply .zshrc
cp "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"
echo "  \033[32m[OK] .zshrc -> $HOME/.zshrc\033[0m"

# Apply .zsh directory
mkdir -p "$HOME/.zsh"
cp -r "$SCRIPT_DIR/.zsh/." "$HOME/.zsh/"
echo "  \033[32m[OK] .zsh/ -> $HOME/.zsh/\033[0m"

echo "\n\033[36mDotfiles applied successfully!\033[0m"
echo "\033[33mRestart your terminal to use the new settings.\033[0m"
