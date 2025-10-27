{ pkgs, lib, ... }: 
{
	home.packages = with pkgs; [
    openboard
  ];

	programs.openboard = {
		enable = true;
	};
}