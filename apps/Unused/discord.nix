{ pkgs, lib, ... }: 
{
	home.packages = with pkgs; [
    vesktop
  ];

	programs.vesktop = {
		enable = true;
	};
}