{ pkgs, ... }:

{

  home.packages = with pkgs; [
    rmpc
    aonsoku
    jellyfin-web
    vlc
    nyaa
    nomacs
  ];

}
