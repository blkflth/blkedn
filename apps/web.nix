{ pkgs, lib, ... }: 
{
	home.packages = with pkgs; [
    firefox
    pywalfox-native
    glance
    protonmail-desktop
    proton-pass
    protonvpn-gui
    vesktop
  ];

	programs.glance = {
		enable = true;
	};
	programs.protonmail-desktop = {
		enable = true;
	};
	programs.proton-pass = {
		enable = true;
	};
	programs.protonvpn-gui = {
		enable = true;
	};
	programs.vesktop = {
		enable = true;
	};
	programs.firefox = {
		enable = true;
	};
	programs.pywalfox-native = {
		enable = true;
	};
}
