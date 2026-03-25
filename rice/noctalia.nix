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

  programs.noctalia-shell = {
    enable = true;
  };

  xdg.configFile."noctalia/settings.json".source = ./settings.json;
}
