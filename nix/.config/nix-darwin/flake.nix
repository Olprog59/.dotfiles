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
            neovim
            mkalias
            obsidian
            arc-browser
            cargo
            nixfmt-rfc-style
            nodejs_23
            kubectl
            kubecolor
            kubescape
            zsh
            ripgrep
            tmux
            starship
            fzf
            zoxide
            direnv
            rbenv
            age
            curl
            atac
            autoconf
            docker
            bat
            exiftool
            fd
            imagemagick
            ffmpeg
            figlet
            terraform
            tmux
            topgrade
            tree
            tree-sitter
            postgresql_17
            nmap
            watch
            biome
            btop
            bun
            wget
            uv
            jq
            openssl_3
            lolcat
            butane
            kubectx
            lua
            sqlite
            yarn
            kustomize
            luarocks
            gh
            lazydocker
            lazygit
            lazysql
            cmake
            gitflow
            colima
            popeye
            sshs
            stow
            yazi
            zsh
            talosctl
            mediainfo
            sops
            samba
            qemu
            tart
            superfile

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
              "k9s"
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
