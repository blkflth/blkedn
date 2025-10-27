{ pkgs, ... }:

{
  home.packages = with pkgs; [
    syncthing
  ];

	programs.syncthing = {
		enable = true;
	};
}