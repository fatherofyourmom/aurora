{ config, lib, pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./locale.nix
    ./nix.nix
    ./security.nix
    ./users.nix
  ];
}
