#!/bin/bash

# Vérification des permissions root
if [ "$EUID" -ne 0 ]; then
  echo "Veuillez exécuter ce script en tant que root (ou avec sudo)."
  exit 1
fi

# Paquets communs avec gestion des noms spécifiques par OS
COMMON_PACKAGES_DEBIAN="bat exa fd-find fzf ripgrep tmux jq zoxide neovim"
COMMON_PACKAGES_ALPINE="bat exa fd fzf ripgrep tmux jq zoxide neovim"
DEBIAN_SPECIFIC="build-essential ffmpeg imagemagick poppler-utils unzip"
ALPINE_SPECIFIC="alpine-sdk ffmpeg imagemagick poppler unzip"

# Installation de paquets supplémentaires
install_optional_tools() {
  echo "Installation des outils optionnels..."

  # Installation de lazydocker (via binaire GitHub)
  if ! command -v lazydocker &>/dev/null; then
    echo "Installation de lazydocker via binaire..."
    curl -Lo /usr/local/bin/lazydocker https://github.com/jesseduffield/lazydocker/releases/download/v0.13.1/lazydocker_$(uname -s)_$(uname -m).tar.gz
    chmod +x /usr/local/bin/lazydocker
  fi

  # Installation de lazygit (via binaire GitHub)
  if ! command -v lazygit &>/dev/null; then
    echo "Installation de lazygit via binaire..."
    curl -Lo /usr/local/bin/lazygit https://github.com/jesseduffield/lazygit/releases/download/v0.37.1/lazygit_$(uname -s)_$(uname -m).tar.gz
    chmod +x /usr/local/bin/lazygit
  fi
}

# Installation des polices pour Debian/Ubuntu uniquement
install_fonts_debian() {
  echo "Installation des polices pour Debian/Ubuntu..."
  apt install -y fonts-noto-color-emoji fonts-jetbrains-mono
}

# Fonction d'installation pour Debian/Ubuntu
install_debian_ubuntu() {
  echo "Système Debian/Ubuntu détecté. Installation des paquets..."
  apt update
  apt install -y $COMMON_PACKAGES_DEBIAN $DEBIAN_SPECIFIC
  install_fonts_debian
  install_optional_tools
}

# Fonction d'installation pour Alpine
install_alpine() {
  echo "Système Alpine détecté. Activation des dépôts edge et installation des paquets..."
  sed -i '/^#.*edge\/main/s/^#//' /etc/apk/repositories
  sed -i '/^#.*edge\/community/s/^#//' /etc/apk/repositories
  sed -i '/^#.*edge\/testing/s/^#//' /etc/apk/repositories
  apk update
  apk add $COMMON_PACKAGES_ALPINE $ALPINE_SPECIFIC
  install_optional_tools
}

# Installation de Oh My Zsh et configuration du thème
# Installation de Oh My Zsh et configuration du thème
install_ohmyzsh() {
  if ! command -v zsh &>/dev/null; then
    echo "Installation de Zsh..."
    if [ -f /etc/debian_version ]; then
      apt install -y zsh
    elif [ -f /etc/alpine-release ]; then
      apk add zsh
    fi
  fi

  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installation de Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    sed -i 's/ZSH_THEME=".*"/ZSH_THEME="ys"/' "$HOME/.zshrc"
  else
    echo "Oh My Zsh est déjà installé."
    sed -i 's/ZSH_THEME=".*"/ZSH_THEME="ys"/' "$HOME/.zshrc"
  fi

  # Définir Zsh comme shell par défaut
  if command -v chsh &>/dev/null; then
    chsh -s $(which zsh) $(whoami)
  elif [ -f /etc/alpine-release ]; then
    # Change le shell dans /etc/passwd pour Alpine
    sed -i "s|^$(whoami):[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:/[^:]*:.*|$(whoami):$(which zsh)|" /etc/passwd
  fi
}

# Détection de l'OS
if [ -f /etc/debian_version ]; then
  install_debian_ubuntu
elif [ -f /etc/alpine-release ]; then
  install_alpine
else
  echo "Système non supporté par ce script."
  exit 1
fi

# Installation de Oh My Zsh et configuration
install_ohmyzsh

echo "Installation terminée. Redémarrez le terminal pour que Zsh soit appliqué comme shell par défaut avec le thème 'ys'."
