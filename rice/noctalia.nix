{
  pkgs,
  inputs,
  ...
}: {
  # import the home manager module
  imports = [
    inputs.noctalia.homeModules.default
  ];

  # configure options

  programs.noctalia = {
    enable = true;
    systemd.enable = true;
  };

  xdg.configFile."noctalia/settings.json".source = ./settings.json;
  #xdg.configFile."noctalia/noctalia-config.toml".source = ./noctalia-config.toml;
}
