{ config, pkgs, ... }:

{
  # * - "https://search.nixos.org/options?channel=25.11&query=powermanagement"
  powerManagement = {
    # ? - Enable Power Management
    # * - "https://search.nixos.org/options?channel=25.11&query=powermanagement.enable"
    enable = true;
  };
}
