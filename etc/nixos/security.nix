{ config, pkgs, ... }:

{
  # * - "https://search.nixos.org/options?channel=25.11&query=security"
  security = {
    # ? - Real-time scheduling toolkit, useful for audio and multimedia apps
    # * - "https://search.nixos.org/options?channel=25.11&query=security.rtkit"
    rtkit = {
      # ? - Enable rtkit service
      # * - "https://search.nixos.org/options?channel=25.11&query=security.rtkit.enable"
      enable = true;
    };

    # ? - PolicyKit configuration for authentication dialogs and privilege management
    # * - "https://search.nixos.org/options?channel=25.11&query=security.polkit"
    polkit = {
      # ? - Enable polkit service
      # * - "https://search.nixos.org/options?channel=25.11&query=security.polkit.enable"
      enable = true;
    };
  };
}
