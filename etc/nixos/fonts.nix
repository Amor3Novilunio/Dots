{ config, pkgs, ... }:

{
  # * - "https://search.nixos.org/options?channel=25.11&query=fonts"
  fonts = {
    # * - "https://search.nixos.org/options?channel=25.11&query=fonts.packages"
    packages = with pkgs; [
      noto-fonts
      noto-fonts-color-emoji
      nerd-fonts.fira-code
      fira-code
      jetbrains-mono
      hack-font
      meslo-lg
      source-code-pro
      iosevka
      inconsolata
      dejavu_fonts
      cascadia-code
      adwaita-icon-theme
    ];
  };
}
