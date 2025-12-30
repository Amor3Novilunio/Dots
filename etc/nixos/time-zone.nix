{ config, pkgs, ... }:

{
  # ? - System time and locale configuration
  # * - "https://search.nixos.org/options?channel=25.11&query=time"
  time = {

    # ? - Set the system time zone
    # * - "https://search.nixos.org/options?channel=25.11&query=time.timeZone"
    timeZone = "Asia/Dubai";

  };

  # ? - Internationalization (i18n) settings
  # * - "https://search.nixos.org/options?channel=25.11&query=i18n"
  i18n = {

    # ? - Default system locale
    # * - "https://search.nixos.org/options?channel=25.11&query=i18n.defaultLocale"
    defaultLocale = "en_US.UTF-8";

    # ? - Additional locale settings for specific categories (address, time, currency, etc.)
    # * - "https://search.nixos.org/options?channel=25.11&query=i18n.extraLocaleSettings"
    extraLocaleSettings = {
      LC_ADDRESS = "en_PH.UTF-8";
      LC_IDENTIFICATION = "en_PH.UTF-8";
      LC_MEASUREMENT = "en_PH.UTF-8";
      LC_MONETARY = "en_PH.UTF-8";
      LC_NAME = "en_PH.UTF-8";
      LC_NUMERIC = "en_PH.UTF-8";
      LC_PAPER = "en_PH.UTF-8";
      LC_TELEPHONE = "en_PH.UTF-8";
      LC_TIME = "en_PH.UTF-8";
    };

  };

}
