{ pkgs, lib, ... }: 
{
	home.packages = with pkgs; [
    numbat
  ];

	programs.numbat = {
		enable = true;
	};
}