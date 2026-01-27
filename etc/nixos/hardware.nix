{ config, pkgs, ... }:

{
  # * - "https://search.nixos.org/options?channel=25.11&query=hardware"
  hardware = {
    # ? - Enable installation of firmware that may be required by some devices
    # * - "https://search.nixos.org/options?channel=25.11&query=hardware.enableRedistributableFirmware"
    enableRedistributableFirmware = true;

    # * - "https://search.nixos.org/options?channel=25.11&query=hardware.graphics"
    graphics = {
      # ? - Enable graphics support (GPU drivers, rendering, etc.)
      # * - "https://search.nixos.org/options?channel=25.11&query=hardware.graphics.enable"
      enable = true;

      # ? - Enable 32-bit graphics libraries (needed for 32-bit applications)
      # * - "https://search.nixos.org/options?channel=25.11&query=hardware.graphics.enable32Bit"
      enable32Bit = true;
    };

    # * - "https://search.nixos.org/options?channel=25.11&query=hardware.bluetooth"
    bluetooth = {
      # ? -
      # * - "https://search.nixos.org/options?channel=25.11&query=hardware.bluetooth.enable"
      enable = true;

      # ? -
      # * - "https://search.nixos.org/options?channel=25.11&query=hardware.bluetooth.powerOnBoot"
      powerOnBoot = true;
    };
  };
}
