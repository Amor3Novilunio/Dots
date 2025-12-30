{ config, pkgs, ... }:

{
  # ! Define a user account. Don't forget to set a password with ‘passwd’.
  # * - "https://search.nixos.org/options?channel=25.11&query=users.users"
  users.users.amor_iii = {
    # ? - Marks this as a regular (non-system) user
    # * - "https://search.nixos.org/options?channel=25.11&query=users.users.isNormalUser"
    isNormalUser = true;

    # ? - Optional: shown in login managers or system tools
    # * - "https://search.nixos.org/options?channel=25.11&query=users.users.description"
    description = "Amor Novilunio III";

    # ? - Shell Selected
    # * - "https://search.nixos.org/options?channel=25.11&query=users.users.shell"
    shell = pkgs.zsh;

    # ? - Grants sudo access and allows network control
    # * - "https://search.nixos.org/options?channel=25.11&query=users.users.extraGroups"
    extraGroups = [ "networkmanager" "wheel" "docker" ];

    # ? - User-specific packages (leave empty or populate)
    # * - "https://search.nixos.org/options?channel=25.11&query=users.users.packages"
    packages = with pkgs; [
      # ? -
      slack
      # ? -
      discord
    ];
  };

  # * ----------------------------------------------------------------------------
  # * ⚠️ Reminder:
  # * You must manually set the password for this user after install:
  # * sudo passwd amor_iii
  # * ----------------------------------------------------------------------------
}
