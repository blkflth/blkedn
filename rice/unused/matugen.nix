{
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.matugen.nixosModules.default
  ];
  programs.matugen = {
    enable = true;
    variant = "dark";
    jsonFormat = "hex";
    type = "scheme-content";
  };
  # xdg.configFile."<path>".source = "${config.programs.matugen.theme.files}/<template_output_path>";

  xdg.configFile."gtk-3.0/gtk.css".source = "${config.programs.matugen.theme.files}/.config/gtk-3.0/gtk.css";

  xdg.configFile."gtk-4.0/gtk.css".source = "${config.programs.matugen.theme.files}/.config/gtk-4.0/gtk.css";
}
