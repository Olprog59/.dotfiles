#!/bin/bash

# Fonction d'installation de Homebrew et des packages
install_homebrew() {
  echo "Installation de Homebrew..."
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
}

install_homebrew_packages() {
  echo "Installation des applications Homebrew..."
  brew install git zsh neovim \
    lazydocker silicon lazygit \
    bat exa fd fzf ripgrep tmux sshs \
    yazi ffmpegthumbnailer sevenzip jq poppler fd ripgrep fzf \
    zoxide imagemagick font-symbols-only-nerd-font \
    font-noto-emoji font-jetbrains-mono-nerd-font \
    portal biome go node rbenv bruno stow orbstack
  brew install --cask wezterm arc magnet
}

# Installation de Setapp apps
echo "Installe manuellement les applications Setapp suivantes : Canary Mail, iStat Menus, CleanShot X, CleanMyMac X, ClearVPN, Paste, et Numi."

# Installation de Raycast
echo "Télécharge Raycast depuis https://www.raycast.com"

# Installation de Starship
install_starship() {
  echo "Installation de Starship..."
  brew install starship
  echo 'eval "$(starship init zsh)"' >>~/.zshrc
}

# Installation de Oh My Zsh et plugins
install_ohmyzsh() {
  echo "Installation de Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

  echo "Installation des plugins pour Oh My Zsh..."
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

  # Activation des plugins dans .zshrc
  sed -i '' 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc
}

# Installation de NeoVim plugins pour live-server et Markdown Preview
install_neovim_plugins() {
  echo "Installation des plugins pour NeoVim..."
  npm install -g live-server
  cd ~/.local/share/nvim/lazy/markdown-preview.nvim && npm install
}

# Installation de GNU Stow pour la gestion des dotfiles
setup_stow() {
  echo "Configuration des dotfiles avec GNU Stow..."
  git clone git@github.com:Olprog59/.dotfiles.git ~/dotfiles
  cd ~/dotfiles
  stow starship tmux wezterm bat atac
}

# Installation de SDKMAN et packages Java
install_sdkman() {
  echo "Installation de SDKMAN et des outils Java..."
  curl -s "https://get.sdkman.io" | bash
  source "$HOME/.sdkman/bin/sdkman-init.sh"
  sdk install gradle
  sdk install kotlin
  sdk install maven
  sdk install springboot
  sdk install java 22.0.2-graal
}

# Installation de Tmux Plugin Manager
install_tmux_plugins() {
  echo "Installation du Tmux Plugin Manager..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

# Installation de Tart
install_tart() {
  echo "Installation de Tart..."
  brew install cirruslabs/cli/tart
  tart clone ghcr.io/cirruslabs/macos-sonoma-base:latest sonoma-base
  tart run sonoma-base
}

# Lancer les fonctions d'installation
install_homebrew
install_homebrew_packages
install_starship
install_ohmyzsh
install_neovim_plugins
setup_stow
install_sdkman
install_tmux_plugins
install_tart

echo "Installation terminée. Redémarrez votre terminal pour appliquer les changements."
