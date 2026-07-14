{ config, lib, pkgs, ... }:

{
  # Power management services
  services = {
    # Enable TLP for power management (laptops)
    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        DISK_IDLE_SECS_ON_AC = 0;
        DISK_IDLE_SECS_ON_BAT = 2;
      };
    };

    # Auto-cpufreq for dynamic CPU frequency scaling
    auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          turbo = "never";
        };
        charger = {
          governor = "performance";
          turbo = "auto";
        };
      };
    };
  };

  # Install power utilities
  environment.systemPackages = with pkgs; [
    brightnessctl
    acpi
  ];
}
