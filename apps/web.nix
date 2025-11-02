{ pkgs, lib, ... }: 

{

	home.packages = with pkgs; [
    firefox
    protonmail-desktop
    proton-pass
    protonvpn-gui
    vesktop
  ];

}
