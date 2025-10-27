{ pkgs, lib, ... }: 

{

	home.packages = with pkgs; [
    firefox
    pywalfox-native
    protonmail-desktop
    proton-pass
    protonvpn-gui
    vesktop
  ];

	programs.firefox = {
		enable = true;
	};

}
