{ config, lib, pkgs, auroraTheme, ... }:

{
  # Enable swww for wallpaper management
  systemd.user.services.swww-daemon = {
    Unit = {
      Description = "swww daemon";
      PartOf = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = "${pkgs.swww}/bin/swww-daemon --format xrgb";
      Restart = "on-failure";
    };

    Install.WantedBy = [ "graphical-session.target" ];
  };

  # Set initial wallpaper
  home.activation.setWallpaper = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    ${pkgs.swww}/bin/swww img ${pkgs.aurora-wallpapers}/share/wallpapers/aurora-default.png --transition-type grow --transition-duration 2 || true
  '';
}
