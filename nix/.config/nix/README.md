# Installation nix

```bash
sh <(curl -L https://nixos.org/nix/install)

cd ~/.config/nix

nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake .

darwin-rebuild switch - flake .
```

```bash
nix flake update
darwin-rebuild switch --flake .
```

# Erreur de certificats

```bash
ls -la /etc/ssl/certs/ca-certificates.crt

sudo rm /etc/ssl/certs/ca-certificates.crt
sudo ln -s /nix/var/nix/profiles/default/etc/ssl/certs/ca-bundle.crt /etc/ssl/certs/ca-certificates.crt
```

# Desinstallation

1. Edit /etc/zshrc, /etc/bashrc, and /etc/bash.bashrc to remove the lines sourcing nix-daemon.sh, which should look like this:

```bash
# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
# End Nix
```

If these files haven't been altered since installing Nix you can simply put the backups back in place:

```bash
sudo mv /etc/zshrc.backup-before-nix /etc/zshrc
sudo mv /etc/bashrc.backup-before-nix /etc/bashrc
sudo mv /etc/bash.bashrc.backup-before-nix /etc/bash.bashrc
```

This will stop shells from sourcing the file and bringing everything you installed using Nix in scope.

2. Stop and remove the Nix daemon services:

```bash
sudo launchctl unload /Library/LaunchDaemons/org.nixos.nix-daemon.plist
sudo rm /Library/LaunchDaemons/org.nixos.nix-daemon.plist
sudo launchctl unload /Library/LaunchDaemons/org.nixos.darwin-store.plist
sudo rm /Library/LaunchDaemons/org.nixos.darwin-store.plist
```

This stops the Nix daemon and prevents it from being started next time you boot the system.

3. Remove the nixbld group and the \_nixbuildN users:

```bash
sudo dscl . -delete /Groups/nixbld
for u in $(sudo dscl . -list /Users | grep _nixbld); do sudo dscl . -delete /Users/$u; done
```

This will remove all the build users that no longer serve a purpose.

4. Edit fstab using sudo vifs to remove the line mounting the Nix Store volume on /nix, which looks like UUID=<uuid> /nix apfs rw,noauto,nobrowse,suid,owners or LABEL=Nix\040Store /nix apfs rw,nobrowse. This will prevent automatic mounting of the Nix Store volume.

5. Edit /etc/synthetic.conf to remove the nix line. If this is the only line in the file you can remove it entirely, sudo rm /etc/synthetic.conf. This will prevent the creation of the empty /nix directory to provide a mountpoint for the Nix Store volume.

6. Remove the files Nix added to your system:

```bash
sudo rm -rf /etc/nix /var/root/.nix-profile /var/root/.nix-defexpr /var/root/.nix-channels ~/.nix-profile ~/.nix-defexpr ~/.nix-channels
```

This gets rid of any data Nix may have created except for the store which is removed next.

7. Remove the Nix Store volume:

```bash
sudo diskutil apfs deleteVolume /nix
```

This will remove the Nix Store volume and everything that was added to the store.

If the output indicates that the command couldn't remove the volume, you should make sure you don't have an unmounted Nix Store volume. Look for a "Nix Store" volume in the output of the following command:

```bash
diskutil list
```

If you do see a "Nix Store" volume, delete it by re-running the diskutil deleteVolume command, but replace /nix with the store volume's diskXsY identifier.

## If you do see a "Nix Store" volume, delete it by re-running the diskutil deleteVolume command, but replace /nix with the store volume's diskXsY identifier.

# Update Package

```bash
nix flake update
darwin-rebuild switch --flake .
```
