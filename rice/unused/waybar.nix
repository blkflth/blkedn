{
  lib,
  pkgs,
  config,
  inputs,
  ...
}: {
  imports = [
    ./waybar/waybarstyle.nix
    ./waybar/waybarsettings.nix
  ];
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
    };
  };
}
