{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    firefox
    protonmail-desktop
    proton-pass
    vesktop
  ];
}
