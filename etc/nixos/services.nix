{ config, pkgs, ... }:

{
  # * - "https://search.nixos.org/options?channel=25.11&query=services"
  services = {

    # ? - Display manager configuration for graphical login
    # * - "https://search.nixos.org/options?channel=25.11&query=services.displayManager"
    displayManager = {
      # ? - Gnome Display Manager
      # * - "https://search.nixos.org/options?channel=25.11&query=services.displayManager.gdm"
      gdm = {
        # ? - Enable Gnome Display Manager login screen
        # * - "https://search.nixos.org/options?channel=25.11&query=services.displayManager.gdm.enable"
        enable = false;
      };
    };

    # ? - Desktop environment configuration
    # * - "https://search.nixos.org/options?channel=25.11&query=services.desktopManager"
    desktopManager = {
      # ? - Gnome Desktop Environment
      # * - "https://search.nixos.org/options?channel=25.11&query=services.desktopManager.gnome"
      gnome = {
        # ? - Enable GNOME Desktop Environment
        # * - "https://search.nixos.org/options?channel=25.11&query=services.desktopManager.gnome.enable"
        enable = false;
      };
    };

    # ? - Enable the X11 windowing system
    # * - "https://search.nixos.org/options?channel=25.11&query=services.xserver"
    xserver = {
      # ? - Master switch for X11 support
      enable = true;

      # ? - Video drivers to use with X11
      # * - "https://search.nixos.org/options?channel=25.11&query=services.xserver.videoDrivers"
      videoDrivers = [ "amdgpu" ];

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

      # ? - JACK audio server support (optional)
      # * - "https://search.nixos.org/options?channel=25.11&query=services.pipewire.jack"
      # jack={
      #   # ? - Enable JACK support for professional audio apps
      #   * - "https://search.nixos.org/options?channel=25.11&query=services.pipewire.jack.enable"
      #   enable = true;
      # };
    };

    # ? - Automatic CPU frequency scaling for battery and performance optimization
    # * - "https://search.nixos.org/options?channel=25.11&query=services.auto-cpufreq"
    auto-cpufreq = {
      # ? - Enable automatic CPU frequency scaling
      # * - "https://search.nixos.org/options?channel=25.11&query=services.auto-cpufreq.enable"
      enable = true;
    };

    # ? - Thermald for CPU thermal management
    # * - "https://search.nixos.org/options?channel=25.11&query=services.thermald"
    thermald = {
      # ? - Enable thermald service to monitor and control CPU temperature
      # * - "https://search.nixos.org/options?channel=25.11&query=services.thermald.enable"
      enable = true;
    };

    # ? - Upower for battery and power management
    # * - "https://search.nixos.org/options?channel=25.11&query=services.upower"
    upower = {
      # ? - Enable upower service to manage power events and battery info
      # * - "https://search.nixos.org/options?channel=25.11&query=services.upower.enable"
      enable = true;
    };

    # ? - UDisks2 for disk and storage management
    # * - "https://search.nixos.org/options?channel=25.11&query=services.udisk2"
    udisks2 = {
      # ? - Enable udisks2 to manage disks, mounts, and storage devices
      # * - "https://search.nixos.org/options?channel=25.11&query=services.udisk2.enable"
      enable = true;
    };

    # ? - Optional session manager for media apps (enabled by default)
    #media-session.enable = true;

    # ? - Optional: enable touchpad support (default in most desktop managers)
    # services.xserver.libinput.enable = true;

    # ? - Optional: enable OpenSSH daemon for remote access
    # services.openssh.enable = true;
  };
}
