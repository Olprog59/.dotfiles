{
  description = "Samuel MICHAUX Nix Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      nix-homebrew,
      ...
    }:
    let
      configuration =
        { pkgs, config, ... }:
        {

          nixpkgs.config.allowUnfree = true;

          environment.systemPackages = [
            pkgs.neovim
            pkgs.mkalias
            pkgs.obsidian
            pkgs.arc-browser
            pkgs.cargo
            pkgs.nixfmt-rfc-style
            pkgs.nodejs_23
            pkgs.kubectl
            pkgs.kubecolor
            pkgs.kubescape
            pkgs.zsh
            pkgs.ripgrep
            pkgs.tmux
            pkgs.starship
            pkgs.fzf
            pkgs.zoxide
            pkgs.direnv
            pkgs.rbenv
            pkgs.age
            pkgs.curl
            pkgs.atac
            pkgs.autoconf
            pkgs.docker
            pkgs.bat
            pkgs.exiftool
            pkgs.fd
            pkgs.imagemagick
            pkgs.ffmpeg
            pkgs.figlet
            pkgs.terraform
            pkgs.tmux
            pkgs.topgrade
            pkgs.tree
            pkgs.tree-sitter
            pkgs.postgresql_17
            pkgs.nmap
            pkgs.watch
            pkgs.biome
            pkgs.btop
            pkgs.bun
            pkgs.wget
            pkgs.uv
            pkgs.jq
            pkgs.k9s
            pkgs.openssl_3
            pkgs.lolcat
            pkgs.butane
            pkgs.kubectx
            pkgs.lua
            pkgs.sqlite
            pkgs.yarn
            pkgs.kustomize
            pkgs.luarocks
            pkgs.gh
            pkgs.lazydocker
            pkgs.lazygit
            pkgs.lazysql
            pkgs.cmake
            pkgs.gitflow
            pkgs.colima
            pkgs.popeye
            pkgs.sshs
            pkgs.stow
            pkgs.yazi
            pkgs.zsh
            pkgs.talosctl
            pkgs.mediainfo
            pkgs.sops
            pkgs.samba
            pkgs.qemu
            pkgs.tart

          ];

          homebrew = {
            enable = true;
            casks = [
              "ghostty"
              "betterdisplay"
              "deskpad"
              "font-noto-emoji"
              "keycastr"
              "headlamp"
              "the-unarchiver"
              "bruno"
              "raycast"
            ];
            brews = [
              "go"
              "helm"
              "docker"
              "docker-compose"
              "docker-credential-helper"
              "ollama"
              "git"
              "clang-format"
              "make"
              "colima"
              "surreal"
            ];
            taps = [
              "surrealdb/tap"
            ];
            onActivation.cleanup = "zap";
          };

          fonts.packages = [
            pkgs.nerd-fonts.droid-sans-mono
            pkgs.nerd-fonts.jetbrains-mono
          ];

          system.activationScripts.applications.text =
            let
              env = pkgs.buildEnv {
                name = "system-applications";
                paths = config.environment.systemPackages;
                pathsToLink = "/Applications";
              };
            in
            pkgs.lib.mkForce ''
              # Set up applications.
              echo "setting up /Applications..." >&2
              rm -rf /Applications/Nix\ Apps
              mkdir -p /Applications/Nix\ Apps
              find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
              while read -r src; do
                app_name=$(basename "$src")
                echo "copying $src" >&2
                ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
              done
            '';

          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";

          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;

          programs.zsh.enable = true;

          # Used for backwards compatibility, please read the changelog before changing.
          # $ darwin-rebuild changelog
          system.stateVersion = 6;

          # The platform the configuration will be used on.
          nixpkgs.hostPlatform = "aarch64-darwin";

          system.defaults = {
            dock.autohide = true;
            dock.persistent-apps = [
              "/System/Applications/Launchpad.app/"
              "/Applications/Arc.app"
              "/Applications/Ghostty.app"
              "/Applications/Setapp/Canary Mail.app"
              "/System/Applications/Messages.app"
              "/System/Applications/Maps.app"
              "/System/Applications/Photos.app"
              "/System/Applications/Calendar.app"
              "/System/Applications/System Settings.app"

            ];
            finder.FXPreferredViewStyle = "Nlsv";
            loginwindow.GuestEnabled = false;
            NSGlobalDomain.AppleICUForce24HourTime = true;
            NSGlobalDomain.KeyRepeat = 2;
            NSGlobalDomain.InitialKeyRepeat = 120;
            NSGlobalDomain.AppleShowAllFiles = true;

          };
        };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#Mac-Studio
      darwinConfigurations."Mac-Studio" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "sam";
              autoMigrate = true;
            };

          }
        ];
      };
    };
}
