{ config, pkgs, ... }:

let
  # ? - Origin Paths
  dir-etc-nixos = "/etc/nixos";
  dir-home-config = "$HOME/.config";
  dir-scripts = "$HOME/Dots/scripts";
  dir-dots = "$HOME/Dots";

  # ? - Flags
  disable-gpu = "--disable-gpu";
  use-wayland = "--ozone-platform=wayland";
  enable-wayland-support = "--enable-features=UseOzonePlatform";

  # ? - Editor
  editor-flags = "${use-wayland} ${enable-wayland-support}";
  editor = "code ${editor-flags}";
in {
  # ? -
  environment.shellAliases = {

    # ? - Origin CD
    cd-etc-nixos = "cd ${dir-etc-nixos}";
    cd-home-config = "cd ${dir-home-config}";
    cd-dots = "cd ${dir-dots}";

    # ? - Modification
    mod-dots = "${editor} ${dir-dots}";
    # ? - Scripts
    switch-dots = "bash ${dir-scripts}/switch.sh";
    gh-auth-switch = "bash ${dir-scripts}/gh-switch.sh";
    storage-mount = "bash ${dir-scripts}/mount.sh";
    storage-unmount = "bash ${dir-scripts}/un-mount.sh";
    storage-dir = "source ${dir-scripts}/mount-directory.sh";

    # ? -  Nixos Alias/Override
    switch-dots-rebuild =
      "sudo nixos-rebuild switch -I nixos-config=${dir-dots}/etc/nixos/configuration.nix";

    # ? - Program Alias/Override
    ls = "eza --icons";
    grep = "rg";
    find = "fd";
    reboot = "sudo reboot now";
    shutdown = "sudo shutdown now";
    code = "${editor}";
    # slack = "slack ${use-wayland} ${enable-wayland-support}";
    # gchrome = "google-chrome-stable ${use-wayland} ${enable-wayland-support}";

    # ? - Helpers
    myKeys = "cat $HOME/Pandora/keys";
  };
}
