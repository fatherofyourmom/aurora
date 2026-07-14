{ config, lib, pkgs, ... }:

{
  programs.fish = {
    enable = true;

    shellInit = ''
      # Aurora shell initialization
      set -g fish_greeting

      # Enable vi mode
      fish_vi_key_bindings
    '';

    functions = {
      # Quick directory navigation
      l = "ls -lh";
      la = "ls -lah";
      ll = "ls -l";
      
      # Git shortcuts
      gstatus = "git status";
      gadd = "git add";
      gcommit = "git commit";
      gpush = "git push";
      gpull = "git pull";
      
      # Nix helpers
      nswitch = "sudo nixos-rebuild switch --flake /etc/nixos#default";
      ntest = "sudo nixos-rebuild test --flake /etc/nixos#default";
      ngc = "sudo nix-collect-garbage -d";
    };

    plugins = [
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair;
      }
      {
        name = "done";
        src = pkgs.fishPlugins.done;
      }
    ];
  };

  # Shell aliases
  home.shellAliases = {
    ".." = "cd ..";
    "..." = "cd ../..";
    "c" = "clear";
    "e" = "exit";
  };
}
