#!/bin/bash

# ─── Homebrew ───────────────────────────────────────────
if ! command -v brew &>/dev/null; then
  echo "🍺 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# ─── Homebrew packages ──────────────────────────────────
echo "📦 Installing packages from Brewfile..."
brew bundle --file=~/dotfiles/Brewfile

# ─── Oh My Zsh ──────────────────────────────────────────
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "🪄 Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# ─── Spaceship Theme ────────────────────────────────────
if [ ! -d "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt" ]; then
  echo "🚀 Installing Spaceship Theme..."
  git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt" --depth=1
  ln -s "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme" "$HOME/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
fi

# ─── ZSH config ─────────────────────────────────────────
echo "🔗 Symlinking .zshrc..."
[ -f ~/.zshrc ] && [ ! -L ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.backup
ln -sf ~/dotfiles/.zshrc ~/.zshrc

# ─── Spaceship config ───────────────────────────────────
echo "🚀 Symlinking Spaceship config..."
mkdir -p ~/.config/spaceship
ln -sf ~/dotfiles/spaceship/spaceship.zsh ~/.config/spaceship/spaceship.zsh

# ─── Spaceship Theme ────────────────────────────────────
if [ ! -d "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt" ]; then
  echo "🚀 Downloading Spaceship Theme..."
  git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt" --depth=1
  ln -sf "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme" "$HOME/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
fi

# ─── Reload shell ───────────────────────────────────────
echo "✅ Done! Please restart your terminal or run 'zsh' to apply changes."

