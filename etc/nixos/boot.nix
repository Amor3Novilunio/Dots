{ config, pkgs, ... }:

{
  # ? - Boot configuration
  # * - "https://search.nixos.org/options?channel=25.11&show=boot"
  boot = {
    # * - "https://search.nixos.org/options?channel=25.11&show=boot.loader"
    # ? - loader configuration
    loader = {

      # * - "https://search.nixos.org/options?channel=25.11&show=boot.loader.systemd-boot"
      systemd-boot = {
        # ? - Enable systemd-boot as the bootloader
        # * - "https://search.nixos.org/options?channel=25.11&show=boot.loader.systemd-boot.enable"
        enable = true;
      };

      # ? - EFI-specific settings
      # * - "https://search.nixos.org/options?channel=25.11&show=efi"
      efi = {

        # ? - Allow NixOS to modify EFI variables (needed for bootloader installation and updates)
        # * - "https://search.nixos.org/options?channel=25.11&show=efi.canTouchEfiVariables
        canTouchEfiVariables = true;
      };
    };

    # ? - List of kernel modules to load at boot
    # * - "https://search.nixos.org/options?channel=25.11&show=kernelModules
    kernelModules = [ "amdgpu" "iwlwifi" ];

    # ? - Additional kernel parameters
    # * - "https://search.nixos.org/options?channel=25.11&show=kernelParams
    kernelParams = [
      # ? - Set resolution and panel orientation for laptop eDP display
      "video=eDP-1:2880x1800,panel_orientation=upside_down"
      # ? - Set resolution for external DP display
      "video=DP-3:2880x1800"
    ];
  };
}
