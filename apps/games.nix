{ pkgs, ... }:

{
  hardware.opengl.driSupport32Bit = true;

	home.packages = with pkgs; [
    steam
    heoric
	gogdl
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

	programs.heoric = {
		enable = true;
	};
	
	programs.gogdl = {
		enable = true;
	};

	programs.blender = {
		enable = true;
	};

}
