{ pkgs, lib, ... }: 

{
	home.packages = with pkgs; [
    xournalpp
    obsidian
    libreoffice-fresh
  ];

}
