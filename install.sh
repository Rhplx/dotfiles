#!/bin/bash

# Install Homebrew if missing
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install all packages from Brewfile
brew bundle --file=~/dotfiles/Brewfile

# Symlink ZSH config
ln -sf ~/dotfiles/.zshrc ~/.zshrc

echo "✅ Done! Restart your terminal."

