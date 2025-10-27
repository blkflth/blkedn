{ pkgs, lib, ... }:

{
	home.packages = with pkgs; [
    clipboard-jh
    superfile
    numbat
    bottom
    microfetch
  ];

}
