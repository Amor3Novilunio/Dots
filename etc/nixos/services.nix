{ config, pkgs, ... }:

{
  # * - "https://search.nixos.org/options?channel=25.11&query=services"
  services = {

    # ? - Enable the X11 windowing system
    # * - "https://search.nixos.org/options?channel=25.11&query=services.xserver"
    xserver = {
      # ? - Master switch for X11 support
      enable = true;

      # ? - Display manager configuration under X11
      # * - "https://search.nixos.org/options?channel=25.11&query=services.xserver.displayManager"
      displayManager = {
        # ? - Light Display Manager
        # * - "https://search.nixos.org/options?channel=25.11&query=services.xserver.displayManager.lightdm"
        lightdm = {
          # ? - LightDM login manager (enabled/disabled)
          # * - "https://search.nixos.org/options?channel=25.11&query=services.xserver.displayManager.lightdm.enable"
          enable = false;
        };
      };

      # ? - Keyboard layout configuration for X11
      # * - "https://search.nixos.org/options?channel=25.11&query=services.xserver.xkb"
      xkb = {
        layout = "us";
        variant = "";
      };
    };

    # ? - Printing service configuration
    # * - "https://search.nixos.org/options?channel=25.11&query=services.printing"
    printing = {
      # ? - Enable printing support via CUPS
      # * - "https://search.nixos.org/options?channel=25.11&query=services.printing.enable"
      enable = true;
    };

    # ? - PulseAudio configuration
    # * - "https://search.nixos.org/options?channel=25.11&query=services.pulseaudio"
    pulseaudio = {
      # ? - Disabled because PipeWire is used instead
      # * - "https://search.nixos.org/options?channel=25.11&query=services.pulseaudio.enable"
      enable = false;
    };

    # ? - PipeWire audio server configuration
    # * - "https://search.nixos.org/options?channel=25.11&query=services.pipewire"
    pipewire = {
      # ? - Enable PipeWire for audio handling
      # * - "https://search.nixos.org/options?channel=25.11&query=services.pipewire.enable"
      enable = true;

      # ? - ALSA compatibility
      # * - "https://search.nixos.org/options?channel=25.11&query=services.pipewire.alsa"
      alsa = {
        # ? - Enable ALSA support for apps
        # * - "https://search.nixos.org/options?channel=25.11&query=services.pipewire.alsa.enable"
        enable = true;

        # ? - Enable 32-bit ALSA library support
        # * - "https://search.nixos.org/options?channel=25.11&query=services.pipewire.alsa.support32Bit"
        support32Bit = true;
      };

      # ? - PulseAudio compatibility via PipeWire
      # * - "https://search.nixos.org/options?channel=25.11&query=services.pipewire.pulse"
      pulse = {
        # ? - Enable PulseAudio clients support
        # * - "https://search.nixos.org/options?channel=25.11&query=services.pipewire.pulse.enable"
        enable = true;
      };

    };

  };
}
