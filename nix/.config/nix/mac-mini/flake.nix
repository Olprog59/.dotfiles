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
            nmap
            watch
            biome
            btop
            wget
            uv
            jq
            openssl_3
            lolcat
            kubectx
            lua
            luarocks
            gh
            lazydocker
            lazygit
            lazysql
            cmake
            gitflow
            colima
            sshs
            stow
            yazi
            zsh
            talosctl
            mediainfo
            sops
            samba
            qemu
            superfile
            ncftp
            inetutils
            python312
            python312Packages.pip
            python312Packages.virtualenvwrapper
            python312Packages.pyside6
            pipx
            ansible
            ansible-lint
            php
            pnpm
            moreutils
          ];

          homebrew = {
            enable = true;
            casks = [
              "ghostty"
              "font-noto-emoji"
              "the-unarchiver"
              "raycast"
            ];
            brews = [
              "go"
              "helm"
              "git"
              "clang-format"
              "make"
              "colima"
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
          nix.settings.experimental-features = [
            "nix-command"
            "flakes"
          ];

          environment.variables.EDITOR = "nvim";

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
              "/Applications/Ghostty.app"
              "/System/Cryptexes/App/System/Applications/Safari.app"
              "/System/Applications/System Settings.app"

            ];
            # finder.FXPreferredViewStyle = "Nlsv";
            loginwindow.GuestEnabled = false;
            NSGlobalDomain.AppleICUForce24HourTime = true;
            NSGlobalDomain.KeyRepeat = 2;
            NSGlobalDomain.InitialKeyRepeat = 15;
            NSGlobalDomain.AppleShowAllFiles = true;
            dock.mru-spaces = false;
            finder.AppleShowAllExtensions = true;
            finder.FXPreferredViewStyle = "clmv";

          };
        };
    in
    {
      # Build darwin flake using:
      darwinConfigurations."Samuels-Mac-mini" = nix-darwin.lib.darwinSystem {
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
