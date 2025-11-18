{
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  noctalia = cmd:
    [
      "noctalia-shell"
      "ipc"
      "call"
    ]
    ++ (pkgs.lib.splitString " " cmd);
in {
  imports = [
    ./waybar/waybarstyle.nix
    ./waybar/waybarsettings.nix
  ];
  programs.waybar = {
    enable = true;
  };
}
