{ pkgs, lib, ... }: 
{
	home.packages = with pkgs; [
    protonmail-desktop
  ];

	programs.protonmail-desktop = {
		enable = true;
	};
}