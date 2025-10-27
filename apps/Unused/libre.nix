{ pkgs, lib, ... }: 
{
	home.packages = with pkgs; [
    libreoffice-fresh
  ];

	programs.libreoffice-fresh = {
		enable = true;
	};
}