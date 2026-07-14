{ config, lib, pkgs, ... }:

{
  # Enable XDG portal for desktop integration
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    gtkUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-kde
    ];
  };

  # Set default applications via XDG
  xdg.mime = {
    enable = true;
    defaultApplications = {
      "text/html" = [ "firefox.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "x-scheme-handler/about" = [ "firefox.desktop" ];
      "x-scheme-handler/unknown" = [ "firefox.desktop" ];
      "application/x-terminal-emulator" = [ "ghostty.desktop" ];
      "inode/directory" = [ "org.kde.dolphin.desktop" ];
    };
  };
}
