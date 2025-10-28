{ pkgs, ... }:

{

  home.packages = with pkgs; [
    blueman
    bluez
    bluez-tools
  ];

}
