{ pkgs, lib, ... }: 
{
	home.packages = with pkgs; [
    xournalpp
    obsidian
    libreoffice-fresh
  ];

	programs.xournalpp = {
		enable = true;
	};
	programs.obsidian = {
		enable = true;
	};
	programs.libreoffice-fresh = {
		enable = true;
	};
}
