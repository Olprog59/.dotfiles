# My dotfiles

## Installation nouveau Mac

### [Setapp](https://my.setapp.com/subscription)

- Canary mail
- iStat Menus
- CleanShot X
- CleanMyMac X
- ClearVPN
- Paste
- Numi

### [Homebrew](https://brew.sh)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### [Raycast](https://www.raycast.com)

### [Arc Browser](https://arc.net)

### [Western](https://wezfurlong.org/wezterm/index.html)

```bash
brew install --cask wezterm@nightly
```

```bash
brew install git zsh neovim
```

### [Install Oh my ZSH](https://ohmyz.sh/)

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

#### Install plugins OH My ZSH

- autosuggesions plugin

```bash

 git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestion

```

- zsh-syntax-highlighting plugin

```bash
 git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```

##### Enable plugins by adding them to `.zshrc`

- Open `.zshrc`
- ` nvim ~/.zshrc
- Find the line which says plugins=(git).
- Replace that line with `plugins=(git zsh-autosuggestions zsh-syntax-highlighting)`

### [NeoVim](https://neovim.io/)

#### For `live-server` on `neovim`

```bash
npm install -g live-server
```

#### For `Markdown Preview` on `neovim`

```bash
cd ~/.local/share/nvim/lazy/markdown-preview.nvim
npm install
```

### [Starship](https://starship.rs/guide/)

```bash
brew install starship
```

### [Stow](https://www.gnu.org/software/stow/)

```bash

brew install stow
```

```bash
Git clone git@github.com:Olprog59/.dotfiles.git
Cd .dotfiles
Stow starship
Stow tmux
Stow wezterm
Stow bat
Stow atac
```

### Apps

```bash
brew install lazydocker silicon lazygit \
    bat exa fd fzf ripgrep tmux sshs \
    yazi ffmpegthumbnailer sevenzip jq poppler fd ripgrep fzf \
    zoxide imagemagick font-symbols-only-nerd-font \
    font-noto-emoji font-jetbrains-mono-nerd-font \
    portal biome go node rbenv bruno
```

### [Atac](https://github.com/Julien-cpsn/ATAC)

```bash
brew tap julien-cpsn/atac
brew install atac

```

### [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### [SDKMan](https://sdkman.io/)

```bash
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install gradle
sdk install kotlin
sdk install maven
sdk install springboot
sdk install java 22.0.2-graal
```

### Split Screen with [Magnet](https://apps.apple.com/us/app/magnet/id441258766)

### [Obrstack](https://orbstack.dev/)

```bash
brew install orbstack
```

### [Tart](https://tart.run/)

```bash
brew install cirruslabs/cli/tart
tart clone ghcr.io/cirruslabs/macos-sonoma-base:latest sonoma-base
tart run sonoma-base
```
