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

          environment.systemPackages = with pkgs; [
            # Éditeurs et outils d'édition
            neovim

            # Outils système
            mkalias

            # Applications de productivité
            obsidian
            arc-browser

            # Langages de programmation et environnements de développement
            cargo
            nodejs_23
            rbenv
            (python3.withPackages (
              ps: with ps; [
                pip
                virtualenv
                pyside6
              ]
            ))
            pipx
            pipenv
            pnpm
            bun
            lua
            luarocks

            # Formatage et linting
            nixfmt-rfc-style
            biome
            # ansible-lint

            # Outils terminal et shell
            zsh
            ripgrep
            tmux
            starship
            fzf
            zoxide
            direnv
            curl
            bat
            fd
            figlet
            tmux
            topgrade
            tree
            watch
            btop
            wget
            uv
            lolcat
            lazydocker
            lazygit
            lazysql
            sshs
            stow
            yazi
            zsh

            # Kubernetes et containers
            kubectl
            kubecolor
            kubescape
            kubectx
            kustomize
            popeye
            talosctl
            tilt
            docker
            colima

            # Infrastructure as Code
            terraform
            # ansible
            butane

            # Base de données
            postgresql_17
            sqlite
            redis

            # Traitement média
            exiftool
            imagemagick
            ffmpeg
            mediainfo

            # Virtualisation
            qemu
            tart

            # Sécurité et cryptographie
            age
            nmap
            openssl_3
            sops
            cosign

            # Réseau
            inetutils
            ncftp
            samba

            # Git et outils de versioning
            gh
            gitflow

            # JSON et traitement de données
            jq

            # Outils de compilation
            autoconf
            cmake
            tree-sitter

            # Périphériques
            qmk

            # Applications bureautiques
            bitwarden-desktop
            keycastr
            the-unarchiver

            # Typographie et documents
            typst

            # Utilitaires divers
            atac
            superfile
            moreutils
          ];

          homebrew = {
            enable = true;
            casks = [
              "ghostty"
              "betterdisplay"
              "deskpad"
              "font-noto-emoji"
              "bruno"
              "raycast"
            ];
            brews = [
              "go"
              "helm"
              "ollama"
              "git"
              "clang-format"
              "make"
              "surreal"
              "derailed/k9s/k9s"
              "talhelper"
            ];
            taps = [
              "surrealdb/tap"
            ];
            onActivation = {
              cleanup = "zap";
              autoUpdate = true;
              upgrade = true;
            };
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
              "/System/Cryptexes/App/System/Applications/Safari.app"
              "/Applications/Setapp/Canary Mail.app"
              "/System/Applications/Messages.app"
              "/System/Applications/FaceTime.app"
              "/System/Applications/Maps.app"
              "/System/Applications/Photos.app"
              "/System/Applications/Calendar.app"
              "/System/Applications/System Settings.app"

            ];
            finder.FXPreferredViewStyle = "Nlsv";
            loginwindow.GuestEnabled = false;
            NSGlobalDomain.AppleICUForce24HourTime = true;
            NSGlobalDomain.KeyRepeat = 2;
            NSGlobalDomain.InitialKeyRepeat = 15;
            NSGlobalDomain.AppleShowAllFiles = true;
            NSGlobalDomain.ApplePressAndHoldEnabled = true;

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
              enableRosetta = false;
              user = "sam";
              autoMigrate = true;
            };

          }
        ];
      };
    };
}
