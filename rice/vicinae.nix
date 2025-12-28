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
      closeOnFocusLoss = true;
      faviconService = "twenty";
      font = {
        normal = "AtkynsonMono NFP";
        size = 11.0;
      };
      keybinding = "default";
      keybinds = {
      };
      popToRootOnClose = true;
      rootSearch = {
        searchFiles = false;
      };
      theme = {
        dark = {
          name = "matugen";
        };
      };
      window = {
        csd = false;
        opacity = 0.98;
        rounding = 10;
      };
    };
  };
}
