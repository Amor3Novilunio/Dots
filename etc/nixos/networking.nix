{ config, pkgs, ... }:

{
  # * - "https://search.nixos.org/options?channel=25.11&query=networking"
  networking = {
    # ? - Set the system hostname
    # * - "https://search.nixos.org/options?channel=25.11&query=networking.hostName"
    hostName = "desktop";

    # ? - Network management service configuration
    # * - "https://search.nixos.org/options?channel=25.11&query=networking.networkmanager"
    networkmanager = {
      # ? - Enable NetworkManager to manage network connections (Ethernet, Wi-Fi, VPN, etc.)
      # * - "https://search.nixos.org/options?channel=25.11&query=networking.networkmanager.enable"
      enable = true;
    };

  };
}
