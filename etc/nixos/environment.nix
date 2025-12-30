{ config, pkgs, ... }:

{
  # * - "https://search.nixos.org/options?channel=25.11&query=environment"
  environment = {
    # * - "https://search.nixos.org/options?channel=25.11&query=environment.systemPackages"
    systemPackages = with pkgs; [
      # ----------------------------------
      # Network Utilities
      # -----------------------------------------------------------------------------------------------------------------------
      # ? - Command-line network downloader
      wget
      # ? - Domain and IP registration information lookup
      whois
      # ? - Network data transfer tool
      curl

      # ----------------------------------
      # Window Manager Utilities
      # -----------------------------------------------------------------------------------------------------------------------
      # ? - Lightweight application launcher
      fuzzel
      # ? - Widget and panel manager for Wayland
      eww

      # ----------------------------------
      # Window Manager Essentials
      # -----------------------------------------------------------------------------------------------------------------------
      # ? - Screen locker for Sway (Wayland)
      swaylock
      # ? - Idle timeout and suspend manager
      swayidle
      # ? - Interactive process viewer
      htop
      # ? - System monitoring and resource viewer
      btop
      # ? - File archiver for 7 z and other formats
      p7zip
      # ? - Adjust screen/backlight brightness
      brightnessctl
      # ? - Monitor temperatures, fans, and voltages
      lm_sensors
      # ? - Hardware info utilities like lspci
      pciutils
      # ? - OpenGL demo programs
      mesa-demos
      # ? - Vulkan utilities for GPU testing and rendering
      vulkan-tools

      # ----------------------------------
      # Core Gnome Libraries
      # ? - Core GNOME utility library
      glib
      # ? - Introspection data for GNOME libraries
      gobject-introspection
      # ? - Standard GNOME desktop settings
      gsettings-desktop-schemas

      # ----------------------------------
      # GTK + Gnome Rendering Stack
      # ? - GTK 3 GUI toolkit
      gtk3
      # ? - GTK 4 GUI toolkit
      gtk4
      # ? - 2 D graphics library
      cairo
      # ? - Text layout and rendering library
      pango
      # ? - Accessibility toolkit for GTK
      atk

      # ----------------------------------
      # Browser
      # -----------------------------------------------------------------------------------------------------------------------

      # ----------------------------------
      # Terminal
      # -----------------------------------------------------------------------------------------------------------------------
      # ? - GPU-accelerated terminal emulator
      alacritty

      # ----------------------------------
      # Shell
      # ----------------------------------------------------------------------------------------------------------------------- 
      # ? - Cross-shell prompt and customizer
      starship

      # ----------------------------------
      # Development Tools
      # -----------------------------------------------------------------------------------------------------------------------
      # ? - Version control system
      git
      # ? - GitHub CLI
      gh
      #? - Nix code formatter
      nixfmt-classic
      # ? - Shell script formatter
      shfmt
      # ? - code editor
      vscode
      # ? - Rust toolchain manager
      rustup
      # ? - Zig compiler
      zig
      # ? - Node.js runtime
      nodejs
      # ? - Python 3 interpreter
      python3
      # ?- High-performance HTTP and reverse proxy server
      nginx
    ];
  };

}
