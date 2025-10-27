{ pkgs, ... }:

{

	home.packages = with pkgs; [
    steam
    lutris
	gamemode
	mangohud
	blender
  ];

	environment.systemPackages = with pkgs; [
		mangohud
	];

	programs.steam = {
		enable = true;
		gamescopeSession.enable = true;
	};

	programs.gamemode = {
		enable = true;
	};

}
