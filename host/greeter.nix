{pkgs, ...}: {
  services.greetd = {
    enable = true;
    useTextGreeter = true;
    settings = {
      default_session = {
        command = ''
          ${pkgs.greetd.tuigreet}/bin/tuigreet \
            --time \
            --asterisks \
            --user-menu \
            --remember \
            --greeting WELCOME \
            --theme text=red;prompt=green;time=red;input=red;border=white;title=red;action=white;greet=white \
            --cmd niri
        '';
        user = "greeter";
      };
    };
  };

  environment.etc."greetd/environments".text = ''
    niri
  '';
}
