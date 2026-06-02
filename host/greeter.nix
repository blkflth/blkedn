{pkgs, ...}: {
  programs.regreet = {
    enable = true;
    font = {
      name = "AtkynsonMono NFP";
      package = pkgs.nerd-fonts.atkynson-mono;
      size = 12;
    };
    iconTheme = {
      name = "Dracula";
      package = pkgs.dracula-icon-theme;
    };
    cursorTheme = {
      name = "catppuccin-frappe-dark-cursors";
      package = pkgs.catppuccin-cursors.frappeDark;
    };
  };

  services.greetd = {
    enable = true;
    useTextGreeter = true;
    settings = {
      default_session = {
        command = "dbus-run-session niri-session --config /home/jlc/Nix/host/nirigreet.kdl";
        /*
            ''
          ${pkgs.tuigreet}/bin/tuigreet \
            --time \
            --asterisks \
            --user-menu \
            --remember \
            --greeting WELCOME \
            --theme text=red;prompt=green;time=red;input=red;border=white;title=red;action=white;greet=white \
            --cmd niri-session
        '';
        */
        user = "greeter";
      };
    };
  };

  environment.etc."greetd/environments".text = ''
    niri
  '';
}
