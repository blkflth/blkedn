{ pkgs, lib, ... }: 
{
	home.packages = with pkgs; [
    starship
  ];

	programs.starship = {
		enable = true;
	};
}