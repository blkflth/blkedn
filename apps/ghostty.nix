{ pkgs, lib, ... }:

{

  home.packages = with pkgs; [
    ghostty
  ];

}
