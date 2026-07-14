{ config, lib, pkgs, ... }:

{
  # Essential packages for the user
  home.packages = with pkgs; [
    # Archive utilities
    zip
    unzip
    p7zip

    # File management
    file
    tree
    ripgrep
    fd

    # System utilities
    htop
    btop
    ncdu
    jq

    # Network utilities
    curl
    wget
    dnsutils

    # Development tools
    git
    gh
  ];
}
