{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    ./drives.nix
    ./programs.nix
    ./services.nix
    ./user-settings.nix
  ];
}
