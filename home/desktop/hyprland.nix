{ config, lib, pkgs, auroraTheme, ... }:

let
  mod = "SUPER";
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;

    settings = {
      # Monitor configuration
      monitor = [
        ",preferred,auto,1"
      ];

      # Input configuration
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
          clickfinger_behavior = true;
        };
        sensitivity = 0;
      };

      # Environment variables
      env = [
        "XDG_SESSION_TYPE,wayland"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "NIXOS_OZONE_WL,1"
      ];

      # Appearance and decoration
      general = {
        gaps_in = auroraTheme.appearance.gaps;
        gaps_out = auroraTheme.appearance.gaps * 2;
        border_size = 2;
        "col.active_border" = "rgba(${auroraTheme.colors.primary}ff) rgba(${auroraTheme.colors.accent}ff) 45deg";
        "col.inactive_border" = "rgba(5C6B7Dff)";
        layout = "dwindle";
      };

      decoration = {
        rounding = auroraTheme.appearance.radius;
        blur = {
          enabled = auroraTheme.appearance.blur;
          size = 8;
          passes = 3;
        };
        shadow = {
          enabled = true;
          range = 20;
          render_power = 3;
          color = "rgba(000000aa)";
        };
      };

      # Animations
      animations = {
        enabled = true;
        bezier = [
          "easeOutQuad, 0.25, 0.46, 0.45, 0.94"
          "easeInOutCubic, 0.65, 0.05, 0.36, 1"
        ];
        animation = [
          "windows, 1, 4, easeOutQuad"
          "windowsIn, 1, 4, easeOutQuad"
          "windowsOut, 1, 4, easeOutQuad"
          "fade, 1, 3, easeOutQuad"
          "workspaces, 1, 4, easeInOutCubic"
        ];
      };

      # Dwindle layout
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      # Keybindings
      bind = [
        # Essential binds
        "${mod}, Return, exec, ghostty"
        "${mod}, D, exec, walker"
        "${mod}, Q, killactive,"
        "${mod}, F, fullscreen, 0"
        "${mod}, Space, togglefloating, active"
        "${mod}, Escape, exec, swaylock"

        # Window switching
        "${mod}, H, movefocus, l"
        "${mod}, L, movefocus, r"
        "${mod}, K, movefocus, u"
        "${mod}, J, movefocus, d"

        # Window movement
        "${mod} SHIFT, H, movewindow, l"
        "${mod} SHIFT, L, movewindow, r"
        "${mod} SHIFT, K, movewindow, u"
        "${mod} SHIFT, J, movewindow, d"

        # Workspaces
        "${mod}, 1, workspace, 1"
        "${mod}, 2, workspace, 2"
        "${mod}, 3, workspace, 3"
        "${mod}, 4, workspace, 4"
        "${mod}, 5, workspace, 5"
        "${mod} SHIFT, 1, movetoworkspace, 1"
        "${mod} SHIFT, 2, movetoworkspace, 2"
        "${mod} SHIFT, 3, movetoworkspace, 3"
        "${mod} SHIFT, 4, movetoworkspace, 4"
        "${mod} SHIFT, 5, movetoworkspace, 5"

        # Media keys
        ", XF86AudioRaiseVolume, exec, pamixer -i 5"
        ", XF86AudioLowerVolume, exec, pamixer -d 5"
        ", XF86AudioMute, exec, pamixer -t"
        ", XF86MonBrightnessUp, exec, brightnessctl set +5%"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
      ];

      # Mouse bindings
      bindm = [
        "${mod}, mouse:272, movewindow"
        "${mod}, mouse:273, resizewindow"
      ];

      # Window rules
      windowrule = [
        "float, title:(Open File)"
        "center, title:(Open File)"
        "float, title:(Select a File)"
        "center, title:(Select a File)"
      ];

      # Startup applications
      exec-once = [
        "swww-daemon"
        "swaync"
        "wl-clipboard-history"
      ];
    };
  };
}
