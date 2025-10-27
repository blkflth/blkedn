{ pkgs, ... }:

{

  home.packages = with pkgs; [
    blueman
  ];

  services = {
    blueman.enable = true;
  };

}
