{ pkgs, lib, ... }: 
{
	home.packages = with pkgs; [
    hugo
  ];

	programs.hugo = {
		enable = true;
	};
}