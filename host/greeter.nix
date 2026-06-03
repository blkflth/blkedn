{
  pkgs,
  lib,
  config,
  ...
}: let
  inherit (lib.meta) getExe;
  inherit (lib.strings) concatStringsSep;

  sessionData = config.services.displayManager.sessionData.desktops;
in {
  services.greetd = {
    enable = true;
    restart = true;
    useTextGreeter = true;

    settings = {
      default_session = {
        command = concatStringsSep " " [
          (getExe pkgs.tuigreet)
          "--time"
          "--asterisks"
          "--remember"
          "--remember-user-session"
          "--greeting WELCOME"
          "--theme text=red;prompt=green;time=red;input=red;border=white;title=red;action=white;greet=white"
          "--sessions '${
            concatStringsSep ":" [
              "${sessionData}/share/wayland-sessions"
            ]
          }'"
        ];
        user = "greeter";
      };
    };
  };

  environment.etc."greetd/environments".text = ''
    niri
  '';
}
