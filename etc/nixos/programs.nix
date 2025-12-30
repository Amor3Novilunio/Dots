{ config, pkgs, ... }:

{
  # * - "https://search.nixos.org/options?channel=25.11&query=programs"
  programs = {
    # ? - Firefox web browser
    # * - "https://search.nixos.org/options?channel=25.11&query=programs.firefox"
    firefox = {
      # ? - Enable Firefox installation
      # * - "https://search.nixos.org/options?channel=25.11&query=programs.firefox.enable"
      enable = true;
    };

    # ? - Niri application
    # * - "https://search.nixos.org/options?channel=25.11&query=programs.niri"
    niri = {
      # ? - Enable Niri installation
      # * - "https://search.nixos.org/options?channel=25.11&query=programs.niri.enable"
      enable = true;
    };

    # ? - Zsh shell configuration
    # * - "https://search.nixos.org/options?channel=25.11&query=programs.zsh"
    zsh = {
      # ? - Enable Zsh as an interactive shell system-wide
      # * - "https://search.nixos.org/options?channel=25.11&query=programs.zsh.enable"
      enable = true;

      # ? - Enable command completion for interactive Zsh shells
      # * - "https://search.nixos.org/options?channel=25.11&query=programs.zsh.enableCompletion"
      enableCompletion = true;

      # ? - Zsh autosuggestions for faster command entry
      # * - "https://search.nixos.org/options?channel=25.11&query=programs.zsh.autosuggestions"
      autosuggestions = {
        # ? - Enable Master switch for Zsh autosuggestions
        # * - "https://search.nixos.org/options?channel=25.11&query=programs.zsh.autosuggestions.enable"
        enable = true;
      };

      # ? - Syntax highlighting in Zsh for better readability
      # * - "https://search.nixos.org/options?channel=25.11&query=programs.zsh.syntaxHighlighting"
      syntaxHighlighting = {
        # ? - Enable Master switch for Zsh syntax highlighting
        # * - "https://search.nixos.org/options?channel=25.11&query=programs.zsh.syntaxHighlighting.enable"
        enable = true;
      };
    };
  };

  # ? - Programs that may require SUID wrappers or additional session configuration
  # * - "https://search.nixos.org/options?channel=25.11&query=programs.mtr"
  # programs.mtr.enable = true;

  # ? - GnuPG agent for key management with optional SSH support
  # * - "https://search.nixos.org/options?channel=25.11&query=programs.gnupg.agent"
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
}
