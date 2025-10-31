{ pkgs, ... }:

{

  home.packages = with pkgs; [
    vlc
    nomacs
    portmidi
  ];

}
