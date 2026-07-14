{ config, lib, pkgs, ... }:

{
  # Set the system-wide locale
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure console keymap
  console.keyMap = "us";

  # Timezone configuration
  time.timeZone = lib.mkDefault "UTC";

  # Enable NTP synchronization
  services.chrony.enable = true;
}
