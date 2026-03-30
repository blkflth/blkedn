{
  pkgs,
  inputs,
  ...
}: {
  # import the home manager module
  /*
  imports = [
    inputs.vicinae.homeModules.default
  ];
  */

  services.vicinae = {
    enable = true;
    systemd = {
      enable = true;
      autoStart = true;
      environment = {
        USE_LAYER_SHELL = 1;
      };
    };
    settings = {
      close_on_focus_loss = true;
      favicon_service = "twenty";
      font = {
        normal = {
          normal = "AtkynsonMono Nerd Font";
          size = 12.0;
        };
      };
      keybinding = "default";
      keybinds = {
      };
      pop_to_root_on_close = true;
      search_files_in_root = false;
      theme = {
        dark = {
          name = "noctalia";
          icon_theme = "Dracula";
        };
      };
      launcher_window = {
        opacity = 1.0;
      };
      window = {
        csd = false;
        opacity = 0.98;
        rounding = 10;
      };
    };
    extensions = with inputs.vicinae-extensions.packages.${pkgs.stdenv.hostPlatform.system}; [
      bluetooth
      firefox
      niri
      nix
      process-manager
    ];
  };
}
