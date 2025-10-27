{ pkgs, lib, ... }: 
{
	home.packages = with pkgs; [
    obsidian
  ];

	programs.obsidian = {
		enable = true;
	};
}