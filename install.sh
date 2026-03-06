#!/bin/bash

# ─── Homebrew ───────────────────────────────────────────
if ! command -v brew &>/dev/null; then
  echo "🍺 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# ─── Homebrew packages ──────────────────────────────────
echo "📦 Installing packages from Brewfile..."
brew bundle --file=~/dotfiles/Brewfile

# ─── ZSH config ─────────────────────────────────────────
echo "🔗 Symlinking .zshrc..."
[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.backup
ln -sf ~/dotfiles/.zshrc ~/.zshrc

# ─── Spaceship config ───────────────────────────────────
echo "🚀 Symlinking Spaceship config..."
mkdir -p ~/.config/spaceship
ln -sf ~/dotfiles/spaceship/spaceship.zsh ~/.config/spaceship/spaceship.zsh

# ─── Reload shell ───────────────────────────────────────
echo "✅ Done! Reloading shell..."
source ~/.zshrc

