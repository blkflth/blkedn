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
    ./greeter.nix
    ./services.nix
    ./user-settings.nix
    ./priv/priv.nix
  ];
}
