{ config, pkgs, ... }:

{
  # * - "https://search.nixos.org/options?channel=25.11&query=networking"
  networking = {
    # ? - Set the system hostname
    # * - "https://search.nixos.org/options?channel=25.11&query=networking.hostName"
    hostName = "CyberDeckDuo";

    # ? - Network management service configuration
    # * - "https://search.nixos.org/options?channel=25.11&query=networking.networkmanager"
    networkmanager = {
      # ? - Enable NetworkManager to manage network connections (Ethernet, Wi-Fi, VPN, etc.)
      # * - "https://search.nixos.org/options?channel=25.11&query=networking.networkmanager.enable"
      enable = true;
    };

    # ? -
    # * -
    firewall = {
      # ? -
      # * -
      enable = true;

      # ? -
      # * -
      allowedTCPPorts = [ 6969 ];
    };

    # ? - Optional: Enable wireless support via wpa_supplicant
    # wireless.enable = true;

    # ? - Optional: Configure system-wide network proxy
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # ? - Optional: Configure firewall allowed ports (TCP/UDP)
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];

    # ? - Optional: Disable firewall if desired
    # networking.firewall.enable = false;
  };
}
